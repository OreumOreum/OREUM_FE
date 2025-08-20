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
import '../../../home/data/models/place_response.dart';
import '../../../home/presentation/widgets/home_title_text.dart';
import '../../../home/presentation/widgets/place_list_tile.dart';
import '../../../review/presentation/widgets/review_list_tile.dart';

class PlaceDetailScreen extends ConsumerStatefulWidget {
  final String placeId;
  final String contentId;
  final String contentTypeId;

  PlaceDetailScreen({
    super.key,
    required this.placeId,
    required this.contentId,
    required this.contentTypeId,
  });

  @override
  ConsumerState<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends ConsumerState<PlaceDetailScreen> {
  bool isExpanded = false;

  final List<Map<String, String>> placeList = [
    {
      'title': '제주항 선터수',
      'address': '제주시 삼동 310-45',
      'image':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '김녕 해수욕장',
      'address': '제주시 구좌읍 김녕해안로 237',
      'image':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '삼지교',
      'address': '제주 서귀포시 삼성리 교회',
      'image':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '서귀포 올레시장',
      'address': '제주 서귀포시 서호동 340',
      'image':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
  ];

  final List<Map<String, String>> detailList = [
    {
      'detail1': '휴무일    연중무휴 ',
      'detail2': '이용시간   10:00~19:00',
      'detail3': '전화번호    064-728-3988',
      'detail4': '주차시설    가능',
      'detail5': '냄비유무    있음',
      'detail6':
          '하늘에서 바라본 모습이 한문 평(平) 자를 이룬 모양을 하고 있어 김녕이라고 불리는, 김녕마을에 있는 해수욕장이다. 거대한 너럭바위 용암 위에 모래가 쌓여 만들어졌으며, 성세기는 외세의 침하늘에서 바라본 모습이 한문 평(平) 자를 이룬 모양을 하고 있어 김녕이라고 불리는, 김녕마을에 있는 해수욕장이다. 거대한 너럭바위 용암 위에 모래가 쌓여 만들어졌으며, 성세기는 외세의 침'
    }
  ];

  final List<Map<String, String>> courseList = [
    {
      'title': '놀멍쉬멍 제주 바다 구경떠나기',
      'address': '제주시',
      'rating': '4.9',
      'reviewNumber': '97'
    },
  ];

  final List<String> courseImages = [
    'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
  ];

  final List<Map<String, String>> mockReview = [
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
    {
      'type': '모험 액티비티형',
      'date': '2025.06.26',
      'content':
          '친절한 응대 감사했습니다. 예약해서 앙기모띠. 매장이 너무 더워가 그 점이 아쉬웠습니다. 다음에 또 올게요. 앙로모띠!',
      'rating': '4'
    },
  ];

  final List<Map<String, String>> placeImages = [
    {
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
    {
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
    {
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
    {
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg'
    },
  ];

  final List<Map<String, String>> mockPlace2 = [
    {
      'title': '성산일출봉',
      'address': '제주특별자치도 서귀포시 성산읍 성산리 1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '협재해수욕장',
      'address': '제주특별자치도 제주시 한림읍 협재리 2497-1',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '한라산국립공원',
      'address': '제주특별자치도 제주시 1100로 2070-61',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '천지연폭포',
      'address': '제주특별자치도 서귀포시 천지동 667-7',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '카카오박물관',
      'address': '제주특별자치도 제주시 첨단로 242',
      'thumbnailImage':
      'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
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
    Future.microtask(() {
      ref
          .read(placeDetailViewModelProvider.notifier)
          .initializePlaceDetail(widget.placeId, widget.contentId, widget.contentTypeId); //일단 하드하게
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(placeDetailViewModelProvider);

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

    if (state.status == UiStatus.error) {
      return Scaffold(
        appBar: CustomAppBar.back(),
        body: Center(
          child: Text('error: ${state.errorMessage}'),
        ),
      );
    }

    PlaceResponse place = state.place!;
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
                  padding:
                      EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (_getContentTypeIcon(place.contentTypeId) !=
                              null) ...[
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
                                if (place.isSaved) {
                                  await ref
                                      .read(
                                          placeDetailViewModelProvider.notifier)
                                      .deleteDefaultFolder(widget.placeId as int);
                                  if (mounted && state.buttonStatus == UiStatus.success) {
                                    CustomToast.showToast(context, '내 폴더에서 삭제되었습니다.', 56.h);
                                  } else if (mounted && state.buttonStatus == UiStatus.error) {
                                    CustomToast.showToast(context, '삭제를 실패하였습니다.', 56.h);
                                  }
                                } else {
                                  await ref
                                      .read(
                                          placeDetailViewModelProvider.notifier)
                                      .addDefaultFolder(widget.placeId as int);
                                  if (mounted &&
                                      state.buttonStatus == UiStatus.success) {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return PlaceDetailAddBottomSheet(
                                          title: place.title,
                                          originImage: place.originImage,
                                          id: 1,
                                        );
                                      },
                                    );
                                  } else if (mounted &&
                                      state.buttonStatus == UiStatus.error) {
                                    CustomToast.showToast(
                                        context, '저장을 실패하였습니다.', 56.h);
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
                          // 🔥 디버깅 로그 추가
                          print('=== PlaceDetailScreen에서 전달하는 위치 정보 ===');
                          print('place.title: ${place.title}');
                          print('place.address: ${place.address}');
                          print('place.mapX (위도): ${place.mapX}');
                          print('place.mapY (경도): ${place.mapY}');
                          print('place.mapX type: ${place.mapX.runtimeType}');
                          print('place.mapY type: ${place.mapY.runtimeType}');
                          print('===========================================');

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

                      ///여행지 소개 부분
                      Text(AppStrings.spotIntro,
                          style: context.textStyles.label3
                              .copyWith(color: AppColors.gray500)),
                      SizedBox(height: 8.h),
                      Text(
                        place.overview != null ? place.overview! : '',
                        //여기 바로 불러옴
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
                      //여기에 넣어야댐
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.travelerReview,
                            style: context.textStyles.label3
                                .copyWith(color: AppColors.gray500),
                          ),
                          TextButton(
                            onPressed: () async {
                              context.push('${RoutePath.createPlaceReview}/${widget.placeId}',extra: {
                                'name': state.place!.title,
                                'address': state.place!.address,
                                'originImage': state.place!.originImage
                              });

                              if (mounted) {
                                await ref
                                    .read(placeDetailViewModelProvider.notifier)
                                    .refreshPlaceDetailBackground(widget.placeId);
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
                      String content =
                          reviews[index].content;
                      double rating = reviews[index].rate;
                      return ReviewListTile(
                          type: type,
                          date: date,
                          content: content,
                          rating: rating);
                    },
                  ),
                ),
                SizedBox(height: 8.h,),
                Divider(height: 1.h, color: AppColors.gray100),
                SizedBox(height: 18.h,),

                if (reviews.length > 3)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            context
                                .push('${RoutePath.reviewPlaceDetail}/${widget.placeId}', extra: {
                              'name': state.place!.title,
                              'address': state.place!.address,
                              'rate': state.place!.averageRate,
                              'originImage': state.place!.originImage
                            });
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
                          final place = typePlaces[index];
                          print('checkcheckplace$place');
                          String placeId = place.placeId.toString();
                          String? contentId = place.contentId;
                          String? contentTypeId = place.contentTypeId;

                          return InkWell(
                            onTap: ()  {
                              context.push('${RoutePath.placeDetail}/${placeId}',
                                  extra: {'contentId' : contentId,
                                    'contentTypeId' : contentTypeId});
                            },
                            child: PlaceListTile(
                              thumbnailImage: place.thumbnailImage ?? '',
                              title: place.title,
                              address: place.address ?? '',
                              isSaved: place.isSaved,
                              placeId: place.placeId,
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
