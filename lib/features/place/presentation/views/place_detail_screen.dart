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
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/features/course/presentation/widgets/detail_container.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_detail_view_model.dart';
import 'package:oreum_fe/features/course/presentation/widgets/image_slider.dart';
import 'package:oreum_fe/features/place/data/models/place_response.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/book_mark_notifier.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/place_detail_view_model.dart';
import 'package:oreum_fe/features/place/presentation/widgets/place_detail_add_bottom_sheet.dart';
import 'package:oreum_fe/features/review/data/models/review_response.dart';

import '../../../../core/constants/animation_path.dart';
import '../../../../core/di/my_type_provider.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../folder/presentation/viewmodels/folder_list_view_model.dart';
import '../../../home/data/models/place_response.dart';
import '../../../home/presentation/widgets/home_title_text.dart';
import '../../../home/presentation/widgets/place_list_tile.dart';
import '../../../review/presentation/widgets/review_list_tile.dart';

class PlaceDetailScreen extends ConsumerStatefulWidget {
  final String placeId;
  final String contentId;
  final String contentTypeId;
  final String? folderId;

  PlaceDetailScreen({
    Key? key, // 🔥 추가
    required this.placeId,
    required this.contentId,
    required this.contentTypeId,
    this.folderId,
  }) : super(key: key ?? ValueKey('place_${placeId}_${contentId}_${contentTypeId}')); // 🔥 수정

  @override
  ConsumerState<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends ConsumerState<PlaceDetailScreen> {
  bool isExpanded = false;
  bool _isWaitingForModal = false; // 🔥 바텀시트 대기 상태 추가
  PlaceResponse? _cachedPlace; // 🔥 캐시된 place 정보 추가
  bool _showExpandButton = false;

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
    print('=== initState 시작: ${widget.placeId} ===');
    _loadPlaceDetail();
  }

  @override
  void didUpdateWidget(PlaceDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('=== didUpdateWidget 호출됨! ===');
    print('=== 이전: ${oldWidget.placeId}, 현재: ${widget.placeId} ===');

    // placeId가 변경되었을 때만 새로 로드
    if (oldWidget.placeId != widget.placeId ||
        oldWidget.contentId != widget.contentId ||
        oldWidget.contentTypeId != widget.contentTypeId) {
      print('=== didUpdateWidget: ${oldWidget.placeId} -> ${widget.placeId} ===');
      _loadPlaceDetail();
    }
  }

  void _loadPlaceDetail() {
    print('=== _loadPlaceDetail 호출: ${widget.placeId} ===');
    Future.microtask(() {
      // 🔥 placeId를 파라미터로 전달하여 해당 placeId의 provider 사용
      ref
          .read(placeDetailViewModelProvider(widget.placeId).notifier)
          .initializePlaceDetail(widget.placeId, widget.contentId, widget.contentTypeId);
    });
  }

  bool _isTextOverflow(String text, TextStyle style, double maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    print('=== build 호출됨: widget.placeId = ${widget.placeId} ===');

    // 🔥 placeId별로 다른 provider 인스턴스 사용
    final state = ref.watch(placeDetailViewModelProvider(widget.placeId));

    final myTypeState = ref.watch(myTravelTypeProvider);
    final myTravelType = myTypeState.myTravelType;
    final myTravelTypeLabel = myTravelType!.type;

    print('=== Provider 로딩상태: ${state.status} ===');

    // 🔥 상태 변화 리스닝도 placeId별로
    ref.listen(placeDetailViewModelProvider(widget.placeId), (previous, next) {
      print('PlaceDetailScreen 상태 변화 감지: ${previous?.buttonStatus} -> ${next.buttonStatus}');

      if (_isWaitingForModal &&
          previous?.buttonStatus != next.buttonStatus &&
          next.buttonStatus == UiStatus.success) {
        print('바텀시트 띄우기');
        _isWaitingForModal = false;

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
      return Scaffold(
        appBar:CustomAppBar.back(),
        body: ErrorRetryWidget(
          onPressed: () {
            ref.read(placeDetailViewModelProvider(widget.placeId).notifier).initializePlaceDetail(widget.placeId,
                widget.contentId,
                widget.contentTypeId);
          },
        ),
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
                  ref.read(placeDetailViewModelProvider(widget.placeId).notifier)
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
                                final bookmarkNotifier = ref.read(bookmarkProvider.notifier);
                                if (place.isSaved) {
                                  // 삭제 로직 (기존과 동일)
                                  await ref
                                      .read(placeDetailViewModelProvider(
                                      widget.placeId.toString())
                                      .notifier)
                                      .deleteDefaultFolder(int.parse(widget.placeId));

                                  await ref.read(folderListViewModelProvider.notifier).refreshFoldersInBackground();

                                  if (widget.folderId != null) {
                                    await ref.read(folderDetailViewModelProvider.notifier)
                                        .refreshMyFolderPlacesBackground(widget.folderId!);
                                  }

                                  final state = ref.read(placeDetailViewModelProvider(
                                      widget.placeId.toString()));
                                  if (context.mounted &&
                                      state.buttonStatus == UiStatus.success) {
                                    setState(() {
                                      bookmarkNotifier.toggleBookmark(int.parse(widget.placeId));
                                    });
                                    CustomToast.showToast(context, '내 폴더에서 삭제되었습니다.', 56.h);
                                  } else if (context.mounted &&
                                      state.buttonStatus == UiStatus.error) {
                                    CustomToast.showToast(context, '삭제를 실패하였습니다.', 56.h);
                                  }
                                } else {
                                  // 🔥 저장 로직 - 바텀시트 구현
                                  print('저장 시작');

                                  // 즉시 UI 업데이트 (북마크 상태 변경)
                                  bookmarkNotifier.toggleBookmark(int.parse(widget.placeId));

                                  // API 호출
                                  await ref
                                      .read(placeDetailViewModelProvider(widget.placeId.toString()).notifier)
                                      .addDefaultFolder(int.parse(widget.placeId));

                                  final state = ref.read(placeDetailViewModelProvider(widget.placeId.toString()));
                                  await ref.read(folderListViewModelProvider.notifier).refreshFoldersInBackground();

                                  if (context.mounted) {
                                    if (state.buttonStatus == UiStatus.success) {
                                      // 성공시 바텀시트 표시
                                      final result = await showModalBottomSheet<bool>(
                                        context: context,
                                        useRootNavigator: true,
                                        builder: (context) {
                                          return PlaceDetailAddBottomSheet(
                                            title: place.title,
                                            originImage: place.originImage,
                                            id: int.parse(widget.placeId),
                                            folderId: widget.folderId,
                                          );
                                        },
                                      );

                                      // 바텀시트 결과 처리
                                      if (result == false) {
                                        // 북마크가 삭제된 경우
                                        bookmarkNotifier.toggleBookmark(int.parse(widget.placeId)); // 다시 false로

                                      } else {
                                        // 저장 완료 또는 폴더 변경

                                      }
                                    } else if (state.buttonStatus == UiStatus.error) {
                                      // 실패시 북마크 상태 되돌리기
                                      bookmarkNotifier.toggleBookmark(int.parse(widget.placeId)); // 다시 false로
                                      CustomToast.showToast(context, '저장을 실패하였습니다.', 56.h);
                                    }
                                  }
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
                        Text(
                            AppStrings.spotIntro,
                            style: context.textStyles.label3.copyWith(color: AppColors.gray500)
                        ),
                        SizedBox(height: 8.h),

                        // LayoutBuilder로 사용 가능한 너비 계산
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final textStyle = context.textStyles.body2.copyWith(color: AppColors.gray400);
                            final maxWidth = constraints.maxWidth;

                            // 텍스트가 3줄을 넘는지 확인
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              final shouldShowButton = _isTextOverflow(place.overview!, textStyle, maxWidth);
                              if (_showExpandButton != shouldShowButton) {
                                setState(() {
                                  _showExpandButton = shouldShowButton;
                                });
                              }
                            });

                            return Column(
                              children: [
                                Text(
                                  place.overview!,
                                  style: textStyle,
                                  maxLines: isExpanded ? null : 3,
                                  overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                                ),

                                // 3줄을 넘을 때만 더보기 버튼 표시
                                if (_showExpandButton) ...[
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
                                              style: context.textStyles.body1.copyWith(color: AppColors.gray200)
                                          )
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            );
                          },
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
                                  place.reviewCount.toString(),
                                  style: context.textStyles.body1
                                      .copyWith(color: AppColors.gray300),
                                ),

                            ],
                          ),
                          TextButton(
                            onPressed: () async {
                              final hasMyReview = reviews.any((review) => review.isMyReview);
                              if (hasMyReview) {
                                // 이미 리뷰를 작성한 경우 토스트 메시지 표시
                                if (mounted) {
                                  CustomToast.showToast(context, '이미 리뷰를 작성하셨습니다.', 56.h);
                                }
                                return;
                              }
                              // 🔥 안전한 place 접근
                              final currentPlace = state.place ?? _cachedPlace;
                              if (currentPlace != null) {
                                // 🔥 리뷰 작성 페이지로 이동하고 결과 받기
                                final result = await context.push('${RoutePath.createPlaceReview}/${widget.placeId}',extra: {
                                  'name': currentPlace.title,
                                  'address': currentPlace.address,
                                  'originImage': currentPlace.originImage
                                });

                                // 🔥 리뷰 작성이 성공했다면 (result == true) 데이터 새로고침
                                if (mounted && result == true) {
                                  await ref
                                      .read(placeDetailViewModelProvider(widget.placeId).notifier)
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
                          ref.read(placeDetailViewModelProvider(widget.placeId).notifier)
                              .refreshPlaceDetailBackground(widget.placeId);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 8.h),

                if (reviews.length > 3)
                  Column(
                    children: [
                      SizedBox(height: 8.h),
                      Divider(height: 1.h, color: AppColors.gray100),
                      SizedBox(height: 18.h),
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
                                    'originImage': currentPlace.originImage,
                                    'reviewCount': state.place?.reviewCount
                                  });
                                }
                              },
                              child: Text('전체보기',
                                  style: context.textStyles.body1
                                      .copyWith(color: AppColors.gray200))),
                        ],
                      ),
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
                            title: AppStrings.typeRecommend(myTravelTypeLabel),
                            primaryText: myTravelTypeLabel,
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
                              context.push('${RoutePath.placeDetail}/$placeId',
                                  extra: {'contentId': contentId,
                                    'contentTypeId': contentTypeId,
                                    'key': 'place_${placeId}_${contentId}_$contentTypeId'});
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
                                ref.read(placeDetailViewModelProvider(widget.placeId).notifier)
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