import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_cache_manager.dart';
import 'package:oreum_fe/core/widgets/error_widget.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/home/domain/entities/carousel_item.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info.dart';
import 'package:oreum_fe/features/home/domain/entities/weather_info_extension.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';

import '../../../../core/constants/content_type_id.dart';
import '../../../../core/constants/image_path.dart';
import '../../../../core/constants/recommendation_titles.dart';
import '../../../../core/constants/route_path.dart';
import '../../../../core/di/my_type_provider.dart';
import '../../data/models/category_recommend_response.dart';
import '../../data/models/place_response.dart';
import '../viewmodels/states/recommend_state.dart';
import '../widgets/page_gradient_carousel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<LargeCategory> largeCategories = LargeCategory.values;

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
    final myTypeState = ref.watch(myTravelTypeProvider);
    final myTravelType = myTypeState.myTravelType;
    final myTravelTypeLabel = myTravelType!.type;

    final children = List.generate(largeCategories.length, (index) {

      final category = largeCategories[index];
      return GestureDetector(
        onTap: () {
          context.push(
            RoutePath.recommend,
            extra: {
              'contentTypeId': category.contentTypeId,
              'type': false,
              'initialFilter': RegionFilter.all
            },
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
      return ErrorRetryWidget(
        onPressed: () {
          ref.read(homeViewModelProvider.notifier).initializeHome();
        },
      );
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
                        child: Text(
                          '다시 시도하기',
                          style: context.textStyles.label3
                              .copyWith(color: AppColors.primary),
                        ),
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
                  background: (spot.originImage == null)
                      ? Container(

                    color: AppColors.gray100,
                    child: Image.asset(
                      ImagePath.imageError,
                      width: 74.r,
                    ),
                  )
                      : CachedNetworkImage(
                    cacheManager: CustomCacheManager(),
                    imageUrl: spot.originImage!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Container(
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
                  isVisited: spot.visited,
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
                    String placeId = categoryPlaces[index].placeId.toString();
                    // String category = categoryPlaces[index].contentTypeId;
                    String thumbnailImage = categoryPlaces[index].orignImage;
                    String contentId = categoryPlaces[index].contentId;
                    String contentTypeId = categoryPlaces[index].contentTypeId;
                    final place = categoryPlaces[index];
                    final LargeCategory largeCategory = LargeCategory.values.firstWhere(
                            (c) => c.contentTypeId.toString() == place.contentTypeId,
                        orElse: () => LargeCategory.touristAttraction
                    );
                    final contentType = ContentTypeId.fromContentTypeId(
                        categoryPlaces[index].contentTypeId);
                    String category = contentType?.label ?? '여행지';
                    final String cardTitle = recommendationTitles[largeCategory]?[myTravelType] ?? category;


                    return Row(
                      children: [
                        PlaceCard(
                          title: cardTitle,
                          type: myTravelTypeLabel,
                          category: category,
                          thumbnailImage: thumbnailImage,
                          onPressed: () {
                            context.push('${RoutePath.placeDetail}/$placeId',
                                extra: {
                                  'contentId': contentId,
                                  'contentTypeId': contentTypeId
                                });
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
              child: SplitRoundedButton(
                onJejuTap: () {
                  context.push(
                    RoutePath.recommend,
                    extra: {
                      'type': true,
                      'contentTypeId': 0,
                      'initialFilter': RegionFilter.jeju,
                    },
                  );
                },
                onSeogwipoTap: () {
                  context.push(
                    RoutePath.recommend,
                    extra: {
                      'type': true,
                      'contentTypeId': 0,
                      'initialFilter': RegionFilter.seogwipo,
                    },
                  );
                },
              ),
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
                      primaryText: myTravelTypeLabel,

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
                        String contentTypeId =
                        courses[index].contentTypeId.toString();


                        return Row(
                          children: [
                            CourseCard(
                              title: title,
                              subTitle: subTitle,
                              thumbnailImage: thumbnailImage,
                              onPressed: () {
                                context.push(
                                    '${RoutePath.courseDetail}/$courseId',
                                    extra: {
                                      'contentId': contentId,
                                      'contentTypeId': contentTypeId
                                    });
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
                      final place = typePlaces[index];
                      print('checkcheckplace$place');
                      String placeId = place.placeId.toString();
                      String? contentId = place.contentId;
                      String? contentTypeId = place.contentTypeId;

                      return InkWell(
                        onTap: () {
                          context.push('${RoutePath.placeDetail}/$placeId',
                              extra: {
                                'contentId': contentId,
                                'contentTypeId': contentTypeId
                              });
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
                  SizedBox(height: 18.h),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.push(
                          RoutePath.recommend,
                          extra: {'contentTypeId': 0,'type': true, 'initialFilter':RegionFilter.all},
                        );
                      },
                      child: Text(
                        AppStrings.viewAll,
                        style: context.textStyles.body1
                            .copyWith(color: AppColors.gray200),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
