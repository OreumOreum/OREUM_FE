import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/content_type_id.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/routes/app_router.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/features/course/presentation/widgets/image_slider.dart';
import 'package:oreum_fe/features/course/presentation/widgets/detail_container.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/place_detail_view_model.dart';
import 'package:oreum_fe/features/place/presentation/widgets/course_detail_list_tile.dart';
import 'package:oreum_fe/features/place/presentation/widgets/place_detail_add_bottom_sheet.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';

import '../../../../core/constants/animation_path.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../home/data/models/place_response.dart';
import '../../../home/presentation/widgets/home_title_text.dart';
import '../../../home/presentation/widgets/place_list_tile.dart';
import '../../../review/presentation/widgets/review_list_tile.dart';

class PlaceDetailScreen extends ConsumerStatefulWidget {
  final String placeId;
  final String contentId;
  final String contentTypeId;

  PlaceDetailScreen({
    required this.placeId,
    required this.contentId,
    required this.contentTypeId,
  }) : super(key: ValueKey('place_detail_${placeId}'));

  @override
  ConsumerState<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends ConsumerState<PlaceDetailScreen> {
  bool isExpanded = false;
  bool _isWaitingForModal = false; // 🔥 바텀시트 대기 상태 추가
  PlaceResponse? _cachedPlace; // 🔥 캐시된 place 정보 추가

  // ... 기존 mock 데이터들은 그대로 유지 ...
  final List<Map<String, String>> placeList = [
    {
      'title': '제주항 선터수',
      'address': '제주시 삼동 310-45',
      'image': 'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    // ... 나머지 mock 데이터들
  ];

  String? _getContentTypeIcon(String contentTypeId) {
    final type = ContentTypeId.fromContentTypeId(contentTypeId);
    switch (type) {
      case ContentTypeId.attraction:
        return IconPath.flags(ContentTypeId.attraction.name);
      case ContentTypeId.culture:
        return IconPath.flags(ContentTypeId.culture.name);
      case ContentTypeId.event:
        return IconPath.flags(ContentTypeId.event.name);
      case ContentTypeId.reports:
        return IconPath.flags(ContentTypeId.reports.name);
      case ContentTypeId.stay:
        return IconPath.flags(ContentTypeId.stay.name);
      case ContentTypeId.shopping:
        return IconPath.flags(ContentTypeId.shopping.name);
      case ContentTypeId.restaurant:
        return IconPath.flags(ContentTypeId.restaurant.name);
      default:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    print('=== initState 호출됨: ${widget.placeId} ===');
    Future.microtask(() {
      ref
          .read(placeDetailViewModelProvider.notifier)
          .initializePlaceDetail(widget.placeId, widget.contentId, widget.contentTypeId);
    });
  }

  @override
  void didUpdateWidget(PlaceDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('=== didUpdateWidget 호출됨!!! ===');
    print('현재 위젯: ${widget.placeId}');
    print('이전 위젯: ${oldWidget.placeId}');
    print('위젯이 같은가? ${widget.placeId == oldWidget.placeId}');

    // placeId가 변경되었을 때 새로운 데이터 로드
    if (oldWidget.placeId != widget.placeId ||
        oldWidget.contentId != widget.contentId ||
        oldWidget.contentTypeId != widget.contentTypeId) {

      print('=== 새로운 장소 데이터 로딩 시작 ===');
      ref
          .read(placeDetailViewModelProvider.notifier)
          .initializePlaceDetail(widget.placeId, widget.contentId, widget.contentTypeId);
    } else {
      print('=== 매개변수가 동일하여 데이터 로딩 안함 ===');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(placeDetailViewModelProvider);

    // 🔥 상태 변화 리스닝 (바텀시트 처리용)
    ref.listen(placeDetailViewModelProvider, (previous, next) {
      print('PlaceDetailScreen 상태 변화 감지: ${previous?.buttonStatus} -> ${next.buttonStatus}');

      if (_isWaitingForModal &&
          previous?.buttonStatus != next.buttonStatus &&
          next.buttonStatus == UiStatus.success) {
        print('바텀시트 띄우기');
        _isWaitingForModal = false;

        // 🔥 캐시된 place 또는 현재 place 사용
        final place = next.place ?? _cachedPlace;
        if (place != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              showModalBottomSheet<bool>(
                context: context,
                builder: (context) {
                  return PlaceDetailAddBottomSheet(
                    title: place.title,
                    originImage: place.originImage,
                    id: int.tryParse(widget.placeId) ?? 0,
                  );
                },
              ).then((result) {
                if (result == true) {
                  print('바텀시트에서 저장 완료 - UI 자동 업데이트됨');
                  // 추가 새로고침 불필요 (상태가 이미 업데이트됨)
                }
              });
            }
          });
        }
      } else if (_isWaitingForModal &&
          previous?.buttonStatus != next.buttonStatus &&
          next.buttonStatus == UiStatus.error) {
        print('저장 실패');
        _isWaitingForModal = false;

        if (mounted) {
          CustomToast.showToast(context, '저장을 실패하였습니다.', 56.h);
        }
      }
    });

    // 로딩 상태
    if (state.status == UiStatus.loading) {
      return Scaffold(
        appBar: CustomAppBar.back(),
        body: Padding(
          padding: EdgeInsets.only(bottom: 56.h),
          child: Center(
            child: Lottie.asset(AnimationPath.loading, repeat: true),
          ),
        ),
      );
    }

    // 에러 상태
    if (state.status == UiStatus.error) {
      return ErrorRetryWidget(
        onPressed: () {
          ref.read(placeDetailViewModelProvider.notifier).initializePlaceDetail(widget.placeId,
              widget.contentId,
              widget.contentTypeId);
        },
      );
    }

    if (state.place != null) {
      _cachedPlace = state.place;
    }

    final place = state.place ?? _cachedPlace;

    if (place == null) {
      return Scaffold(
        appBar: CustomAppBar.back(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '장소 정보를 불러올 수 없습니다.',
                style: context.textStyles.headLine4.copyWith(
                  color: AppColors.gray400,
                ),
              ),
              SizedBox(height: 16.h),
              TextButton(
                onPressed: () {
                  // 다시 시도 로직
                  ref.read(placeDetailViewModelProvider.notifier)
                      .initializePlaceDetail(
                      widget.placeId,
                      widget.contentId,
                      widget.contentTypeId
                  );
                },
                child: Text(
                  '다시 시도',
                  style: context.textStyles.label2.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // 이제 place는 확실히 non-null이므로 안전하게 사용
    List<ReviewResponse> reviews = state.reviews;
    List<Place> typePlaces = state.typePlaces;

    return Scaffold(
        appBar: CustomAppBar.back(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageSlider(image: place.originImage),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (_getContentTypeIcon(place.contentTypeId) != null) ...[
                            SvgPicture.asset(
                                _getContentTypeIcon(place.contentTypeId)!,
                                height: 26.h),
                            if (place.isSpot) SizedBox(width: 12.w),
                          ],
                          if (place.isSpot)
                            SvgPicture.asset(IconPath.monthSpot, height: 26.h),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              place.title,
                              style: context.textStyles.headLine3
                                  .copyWith(color: AppColors.gray500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 24.r,
                            width: 24.r,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () async {
                                // 🔥 안전한 placeId 파싱
                                final placeIdInt = int.tryParse(widget.placeId);
                                if (placeIdInt == null) {
                                  print('placeId 파싱 실패: ${widget.placeId}');
                                  return;
                                }

                                if (place.isSaved) {
                                  // 삭제 로직
                                  await ref
                                      .read(placeDetailViewModelProvider.notifier)
                                      .deleteDefaultFolder(placeIdInt);

                                  if (mounted && ref.read(placeDetailViewModelProvider).buttonStatus == UiStatus.success) {
                                    CustomToast.showToast(context, '내 폴더에서 삭제되었습니다.', 56.h);
                                  } else if (mounted && ref.read(placeDetailViewModelProvider).buttonStatus == UiStatus.error) {
                                    CustomToast.showToast(context, '삭제를 실패하였습니다.', 56.h);
                                  }
                                } else {
                                  // 저장 로직 - PlaceListTile과 동일한 방식
                                  print('저장 시작');
                                  _isWaitingForModal = true; // 모달 대기 상태 설정

                                  await ref
                                      .read(placeDetailViewModelProvider.notifier)
                                      .addDefaultFolder(placeIdInt);
                                }
                              },
                              icon: SvgPicture.asset(
                                place.isSaved
                                    ? IconPath.bookmarkFill
                                    : IconPath.bookmarkOutline,
                                width: 16.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(place.address,
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.gray400)),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          SvgPicture.asset(IconPath.star2),
                          SizedBox(width: 2.w),
                          Text(place.averageRate.toStringAsFixed(1),
                              style: context.textStyles.caption1
                                  .copyWith(color: AppColors.gray200)),
                          SizedBox(width: 2.w),
                          Text('(${place.reviewCount.toString()})',
                              style: context.textStyles.caption1
                                  .copyWith(color: AppColors.gray200))
                        ],
                      ),
                      SizedBox(height: 63.h),
                      Builder(
                        builder: (context) {
                          return DetailContainer(
                            tourData: state.tour,
                            address: place.address,
                            latitude: place.mapY,
                            longitude: place.mapX,
                            isMapTabEnabled: true,
                          );
                        },
                      ),
                      SizedBox(height: 56.h),

                      if (place.overview != null && place.overview!.isNotEmpty) ...[
                        ///여행지 소개 부분
                        Text(AppStrings.spotIntro,
                            style: context.textStyles.label3
                                .copyWith(color: AppColors.gray500)),
                        SizedBox(height: 8.h),
                        Text(
                          place.overview!,
                          style: context.textStyles.body2
                              .copyWith(color: AppColors.gray400),
                          maxLines: isExpanded ? null : 3,
                          overflow: isExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 18.h),
                        Divider(height: 1.h, color: AppColors.gray100),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: Text(
                                    isExpanded ? '접기' : AppStrings.showMore,
                                    style: context.textStyles.body1
                                        .copyWith(color: AppColors.gray200))),
                          ],
                        ),
                        SizedBox(height: 48.h),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppStrings.travelerReview,
                                style: context.textStyles.label3
                                    .copyWith(color: AppColors.gray500),
                              ),
                                SizedBox(width: 6.w),
                                Text(
                                  reviews.length.toString(),
                                  style: context.textStyles.body1
                                      .copyWith(color: AppColors.gray300),
                                ),

                            ],
                          ),
                          TextButton(
                            onPressed: () async {
                              // 🔥 안전한 place 접근
                              final currentPlace = state.place ?? _cachedPlace;
                              if (currentPlace != null) {
                                context.push('${RoutePath.createPlaceReview}/${widget.placeId}',extra: {
                                  'name': currentPlace.title,
                                  'address': currentPlace.address,
                                  'originImage': currentPlace.originImage
                                });

                                if (mounted) {
                                  await ref
                                      .read(placeDetailViewModelProvider.notifier)
                                      .refreshPlaceDetailBackground(widget.placeId);
                                }
                              }
                            },
                            child: Text(
                              AppStrings.doReview,
                              style: context.textStyles.label4
                                  .copyWith(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(height: 1.h, color: AppColors.gray100),
                SizedBox(height: 6.h),
                SizedBox(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: reviews.length > 3 ? 3 : reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      String type = '${reviews[index].type}';
                      String date = reviews[index].createdAt.toString().split(' ')[0];
                      String content = reviews[index].content;
                      double rating = reviews[index].rate;
                      bool isMyReview = reviews[index].isMyReview;
                      int reviewId = reviews[index].reviewId;
                      return ReviewListTile(
                          type: type,
                          date: date,
                          content: content,
                          rating: rating,
                        isMyReview: isMyReview,
                        reviewId: reviewId,
                        onReviewDeleted: () {
                          ref.read(placeDetailViewModelProvider.notifier)
                              .refreshPlaceDetailBackground(widget.placeId);
                        },
                      );
                    },
                  ),
                ),
                if (reviews.isNotEmpty) ...[
                  SizedBox(height: 8.h),
                  Divider(height: 1.h, color: AppColors.gray100),
                  SizedBox(height: 18.h),
                ],

                if (reviews.length > 3)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            // 🔥 안전한 place 접근
                            final currentPlace = state.place ?? _cachedPlace;
                            if (currentPlace != null) {
                              context.push('${RoutePath.reviewPlaceDetail}/${widget.placeId}', extra: {
                                'name': currentPlace.title,
                                'address': currentPlace.address,
                                'rate': currentPlace.averageRate,
                                'originImage': currentPlace.originImage
                              });
                            }
                          },
                          child: Text('전체보기',
                              style: context.textStyles.body1
                                  .copyWith(color: AppColors.gray200))),
                    ],
                  ),
                SizedBox(height: 48.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.defaultPadding,
                        ),
                        child: HomeTitleText(
                            title: AppStrings.typeRecommend('모험 액티비티형'),
                            primaryText: '모험 액티비티형',
                            subtitle: AppStrings.typePlaceRecommendation),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        itemCount: typePlaces.length,
                        itemBuilder: (BuildContext context, int index) {
                          final typePlace = typePlaces[index];
                          String placeId = typePlace.placeId.toString();
                          String? contentId = typePlace.contentId;
                          String? contentTypeId = typePlace.contentTypeId;

                          return InkWell(
                            onTap: () {
                              print('=== 네비게이션 시작: $placeId ==='); // 🔥 이 로그 추가
                              context.push('${RoutePath.placeDetail}/${placeId}',
                                  extra: {'contentId': contentId,
                                    'contentTypeId': contentTypeId});
                            },
                            child: PlaceListTile(
                              thumbnailImage: typePlace.thumbnailImage ?? '',
                              title: typePlace.title,
                              address: typePlace.address ?? '',
                              isSaved: typePlace.isSaved,
                              placeId: typePlace.placeId,
                              // 🔥 onBookmarkChanged 콜백 추가
                              onBookmarkChanged: (int changedPlaceId, bool newIsSaved) {
                                print('PlaceDetailScreen에서 북마크 상태 변경 감지: $changedPlaceId -> $newIsSaved');
                                // typePlaces 새로고침을 위해 전체 상태 새로고침
                                ref.read(placeDetailViewModelProvider.notifier)
                                    .refreshPlaceDetailBackground(widget.placeId);
                              },
                            ),
                          );
                        },
                      ),
                      Divider(
                        height: 1.h,
                        thickness: 1.h,
                        color: AppColors.gray100,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
              ],
            ),
          ),
        ));
  }
}