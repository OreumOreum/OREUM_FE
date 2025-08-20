import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_cache_manager.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/home/data/services/weather_service.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/home/domain/entities/carousel_item.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info_extension.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';

import '../../../../core/constants/content_type_id.dart';
import '../../data/models/category_recommend_response.dart';
import '../../data/models/place_response.dart';
import '../viewmodels/states/home_state.dart';
import '../../../../core/constants/image_path.dart';
import '../../../../core/constants/route_path.dart';
import '../../../../core/constants/ui_status.dart';
import '../../../../core/di/my_type_provider.dart';
import '../viewmodels/home_view_model.dart';
import '../widgets/page_gradient_carousel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<LargeCategory> largeCategories = LargeCategory.values;

  final List<Map<String, String>> mockPlace = [
    {
      'title': '한여름 밤의 캠핑장',
      'type': '모험 액티비티형',
      'category': '숙소',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '눈 덮인 산장의 따뜻한 하루',
      'type': '모험 액티비티형',
      'category': '숙소',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '도심 속 힐링 스파텔',
      'type': '모험 액티비티형',
      'category': '숙소',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '파도 소리 가득한 바닷가 민박',
      'type': '모험 액티비티형',
      'category': '숙소',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '오지 속 비밀의 집',
      'type': '모험 액티비티형',
      'category': '숙소',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '한옥의 멋과 맛',
      'type': '모험 액티비티형',
      'category': '숙소',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
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
  final List<Map<String, String>> mockCourse = [
    {
      'title': '제주 감성 드라이브 코스',
      'subTitle': '바다 따라 달리는 감성 가득한 힐링 드라이브',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '도심 속 자연 산책 코스',
      'subTitle': '카페부터 공원까지, 여유를 즐기는 하루 루트',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '서귀포 문화 유산 코스',
      'subTitle': '전통과 현대가 공존하는 서귀포 명소 탐방',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '제주시 반나절 여행 코스',
      'subTitle': '짧지만 알찬 핵심 스팟들로 구성된 루트',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '오름과 함께하는 자연 힐링 코스',
      'subTitle': '오름 산책과 자연 경관을 느낄 수 있는 여행',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '아이와 함께하는 제주 체험 코스',
      'subTitle': '아이와 즐기기 좋은 체험형 명소들 모음',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '푸른 바다와 노을을 따라 걷는 제주시 해안 산책 코스',
      'subTitle': '감성 가득한 바다 풍경 속에서 힐링하는 시간',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '제주의 속살을 느낄 수 있는 전통시장과 로컬 맛집 코스',
      'subTitle': '먹거리와 사람 사는 이야기가 있는 하루',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '하루 만에 둘러보는 서귀포 자연 명소 집중 탐방 코스',
      'subTitle': '오름, 폭포, 해안 절경까지 한 번에',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '커플을 위한 감성 가득 인생샷 스팟 코스 in 제주',
      'subTitle': '카메라만 들면 어디든 화보 되는 로맨틱 코스',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '아이들과 함께하는 즐거운 체험과 동물 친구들 만나는 코스',
      'subTitle': '가족 여행에 딱! 체험 중심 코스 추천',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
    },
    {
      'title': '제주 숨은 명소를 찾아 떠나는 로컬 감성 여행 코스',
      'subTitle': '사람 많지 않은 조용한 장소 위주로 구성',
      'thumbnailImage':
          'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
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

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(homeViewModelProvider.notifier).initializeHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;
    final state = ref.watch(homeViewModelProvider);
    final children = List.generate(largeCategories.length, (index) {
      final category = largeCategories[index];
      return GestureDetector(
        onTap: () {
          context.push(
            RoutePath.recommend,
            extra: {'contentTypeId': category.contentTypeId},
          );
        },
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 52.r,
              width: 52.r,
              child: Center(
                child: SvgPicture.asset(
                  category.iconPath,
                  width: category.iconWidth,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              category.label,
              style:
                  context.textStyles.body2.copyWith(color: AppColors.gray400),
            ),
          ],
        ),
      );
    });

    if (state.status == UiStatus.loading ||
        state.weatherStatus == UiStatus.loading) {
      return Padding(
        padding: EdgeInsets.only(bottom: 56.h),
        child: Center(child: Lottie.asset(AnimationPath.loading, repeat: true)),
      ); //로티
    }

    if (state.status == UiStatus.error) {
      return Text('error: ${state.errorMessage}');
    }

    final homeState = ref.watch(homeViewModelProvider);
    WeatherInfo? weatherInfo = state.weatherInfo;
    List<CourseResponse> courses = state.courses;
    List<CategoryRecommendResponse> categoryPlaces = state.categoryPlaces;
    List<Place> typePlaces = state.typePlaces;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ================= 날씨 ===================
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
              child: state.weatherStatus == UiStatus.error
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '날씨를 불러오는데 실패했습니다.',
                              style: context.textStyles.label3
                                  .copyWith(color: AppColors.gray400),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            TextButton(
                              onPressed: () async {
                                await ref
                                    .read(homeViewModelProvider.notifier)
                                    .refreshWeatherBackground();
                              },
                              child: Text('다시 시도하기',  style: context.textStyles.label3
                                  .copyWith(color: AppColors.primary),),
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          height: 72.r,
                          width: 72.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.weatherType('error'),
                              width: 72.r,
                            ),
                          ),
                        ),
                        Container(
                          width: 42.w,
                          alignment: Alignment.centerRight,
                          child: Text(
                            '오류',
                            style: context.textStyles.headLine2
                                .copyWith(color: AppColors.secondary),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.weatherTitle,
                              style: context.textStyles.headLine2
                                  .copyWith(color: AppColors.gray600),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              weatherInfo!.description,
                              style: context.textStyles.body1
                                  .copyWith(color: AppColors.gray300),
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          height: 72.r,
                          width: 72.r,
                          child: Center(
                            child: SvgPicture.asset(
                              weatherInfo.iconAsset,
                              width: weatherInfo.iconWidth,
                            ),
                          ),
                        ),
                        Container(
                          width: 42.w,
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${weatherInfo.temp}°',
                            style: context.textStyles.headLine2
                                .copyWith(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
            ),

            /// ============================================
            /// ================= 이달의 여행지 ===================
            SizedBox(
              height: 14.h,
            ),
              PagedGradientCarousel(
                onItemTap: (index) {
                  final tappedSpot = homeState.monthlySpots[index];
                  context.push(
                    RoutePath.monthlySpotMap,
                    extra: {
                      'year': homeState.year,
                      'month': homeState.month,
                      'placeId': tappedSpot.placeId,
                      'spots': homeState.monthlySpots,
                    },
                  );
                },
                items: homeState.monthlySpots.asMap().entries.map((entry) {
                  final index = entry.key;
                  final spot = entry.value;
                  final count = homeState.myTypeVisitCounts[spot.spotId] ?? 0;
                  const fixedCities = ['서귀포시', '서귀포시', '제주시', '제주시'];
                  final String city =
                      (index < fixedCities.length) ? fixedCities[index] : '제주';

                  return CarouselItem(
                    background: (spot.thumbnailImage == null)
                      ? Container(
                      color: AppColors.gray100,
                      child: Image.asset(
                        ImagePath.imageError,
                        width: 74.r,
                      ),
                    )
                    : CachedNetworkImage(
                      cacheManager: CustomCacheManager(),
                      imageUrl:  spot.thumbnailImage!,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          Container(
                            color: AppColors.gray100,
                            child: Image.asset(
                              ImagePath.imageError,
                              width: 74.r,
                            ),
                          ),
                    ),
                    title: spot.title,
                    count: count.toString(),
                    city: city,
                  );
                }).toList(),
              ),
            SizedBox(
              height: 14.h,
            ),

            /// ============================================
            /// ================= 카테고리 ===================
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 6.h),
              child: isWideScreen
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // 혹은 spaceAround
                        children: children,
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          children:
                              List.generate(children.length * 2 - 1, (index) {
                            if (index.isOdd) {
                              return SizedBox(width: 14.w); // 아이템 사이 간격
                            } else {
                              return children[index ~/ 2];
                            }
                          }),
                        ),
                      ),
                    ),
            ),

            /// ============================================
            /// ================= 서치바 ===================
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 16.w, horizontal: AppSizes.defaultPadding),
              child: SearchBarButton(),
            ),

            /// ============================================
            /// ================= 여행지 추천 =================
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                child: Row(
                  children: List.generate(categoryPlaces.length, (index) {
                    String title = mockPlace[index]['title']!;
                    String type = mockPlace[index]['type']!;
                    String placeId = categoryPlaces[index].placeId.toString();
                   // String category = categoryPlaces[index].contentTypeId;
                    String thumbnailImage = categoryPlaces[index].orignImage;
                    String contentId = categoryPlaces[index].contentId;
                    String contentTypeId = categoryPlaces[index].contentTypeId;

                    final contentType = ContentTypeId.fromContentTypeId(categoryPlaces[index].contentTypeId);
                    String category = contentType?.label ?? '여행지';

                    return Row(
                      children: [
                        PlaceCard(
                          title: category,
                          type: type,
                          category: category,
                          thumbnailImage: thumbnailImage,
                          onPressed: () {
                            context.push('${RoutePath.placeDetail}/${placeId}',
                            extra: {'contentId' : contentId,
                            'contentTypeId' : contentTypeId});
                          },
                        ),
                        if (index != categoryPlaces.length - 1)
                          SizedBox(width: 8.w), // separator 역할
                      ],
                    );
                  }),
                ),
              ),
            ),

            /// ============================================
            /// ================= 추천 버튼 =================
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 14.h, horizontal: AppSizes.defaultPadding),
              child: SplitRoundedButton(),
            ),

            /// ============================================
            SizedBox(
              height: 14.h,
            ),

            /// ================= 코스 추천 =================
            Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                    child: HomeTitleText(
                      title: AppStrings.personalizedCourseRecommendation,
                      //TODO 유형 추가 enum
                      primaryText: '모험 액티비티형',
                      subtitle: AppStrings.typeCourseRecommendation,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(courses.length, (index) {
                        String title = courses[index].title;
                        String subTitle = courses[index].title;
                        String? thumbnailImage = courses[index].originImage;
                        String courseId = courses[index].id.toString();
                        String contentId = courses[index].contentId.toString();
                        String contentTypeId = courses[index].contentTypeId.toString();

                        return Row(
                          children: [
                            CourseCard(
                              title: title,
                              subTitle: subTitle,
                              thumbnailImage: thumbnailImage,
                              onPressed: () {
                                context.push('${RoutePath.courseDetail}/${courseId}',
                                    extra: {'contentId' : contentId,
                                      'contentTypeId' : contentTypeId});
                              },
                            ),
                            if (index != courses.length - 1)
                              SizedBox(width: 9.w), // separator 역할
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.h,
            ),

            ///============================================
            /// ================= 타입별 추천 =================
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
                      //TODO 유형 연결
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
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
