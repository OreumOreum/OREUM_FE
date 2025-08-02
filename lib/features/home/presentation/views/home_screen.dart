import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/search_bar_button.dart';
import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/home/domain/entities/carousel_item.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';

import '../viewmodels/states/home_state.dart';
import '../widgets/page_gradient_carousel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

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
    final state = ref.watch(homeViewModelProvider);

    if (state.status == HomeStatus.loading) {
      return const CircularProgressIndicator(); //로티
    }

    if (state.status == HomeStatus.error) {
      return Text('error: ${state.errorMessage}');
    }

    List<CourseResponse> courses = state.courses;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ================= 날씨 ===================
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 24.w),
            child: Row(
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
                      AppStrings.weatherType('매우 맑을 것'),
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
                      IconPath.cloud,
                      width: 52.w,
                    ),
                  ),
                ),
                Text(
                  '30°',
                  style: context.textStyles.headLine2
                      .copyWith(color: AppColors.primary),
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
            items: [
              CarouselItem(
                background: Image.network(
                  'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
                  fit: BoxFit.cover,
                ),
                title: '섭지코지',
                count: '300',
                city: '제주도시',
              ),
              CarouselItem(
                background: Image.network(
                  'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
                  fit: BoxFit.cover,
                ),
                title: '섭지코지',
                count: '100',
                city: '제주도시',
              ),
              CarouselItem(
                background: Container(color: Colors.deepOrange),
                title: '섭지코지',
                count: '20',
                city: '제주도시',
              ),
              CarouselItem(
                background: Image.network(
                  'http://tong.visitkorea.or.kr/cms/resource/13/729013_image2_1.jpg',
                  fit: BoxFit.cover,
                ),
                title: '섭지코지',
                count: '40',
                city: '제주도시',
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),

          /// ============================================
          /// ================= 카테고리 ===================
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 6.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w), // 양쪽 14 고정
                child: Row(
                  children:
                      List.generate(largeCategories.length * 2 - 1, (index) {
                    if (index.isOdd) {
                      return SizedBox(width: 14.w); // 아이템 사이 간격
                    } else {
                      final category = largeCategories[index ~/ 2];
                      return GestureDetector(
                        onTap: () {
                          print('${category.label} tapped');
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
                              style: context.textStyles.body2
                                  .copyWith(color: AppColors.gray400),
                            ),
                          ],
                        ),
                      );
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
              padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: Row(
                children: List.generate(mockPlace.length, (index) {
                  String title = mockPlace[index]['title']!;
                  String type = mockPlace[index]['type']!;
                  String category = mockPlace[index]['category']!;
                  String thumbnailImage = mockPlace[index]['thumbnailImage']!;
                  return Row(
                    children: [
                      PlaceCard(
                        title: title,
                        type: type,
                        category: category,
                        thumbnailImage: thumbnailImage,
                        onPressed: () {},
                      ),
                      if (index != mockPlace.length - 1)
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
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                  child: HomeTitleText(
                    title: AppStrings.personalizedCourseRecommendation,
                    primaryText: '모험 액티비티형',
                    subtitle: AppStrings.typeCourseRecommendation,
                  ),
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    children: List.generate(courses.length, (index) {
                      String title = courses[index].title;
                      String subTitle = courses[index].title;
                      String thumbnailImage = courses[index].originImage;

                      return Row(
                        children: [
                          CourseCard(
                            title: title,
                            subTitle: subTitle,
                            thumbnailImage: thumbnailImage,
                            onPressed: () {},
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
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    String title = mockPlace2[index]['title']!;
                    String address = mockPlace2[index]['address']!;
                    String thumbnailImage =
                        mockPlace2[index]['thumbnailImage']!;
                    return PlaceListTile(
                        thumbnailImage: thumbnailImage,
                        title: title,
                        address: address);
                  },
                ),
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppColors.gray100,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
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
          SizedBox(
            height: 14.h,
          ),

          ///============================================
          /// ================= 이런 여행지는 어때요? =================
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                  child: HomeTitleText(
                    title: AppStrings.travelSuggestionTitle,
                    primaryText: '모험 액티비티형',
                    subtitle: AppStrings.destinationRecommendToUser,
                  ),
                ),
                SizedBox(height: 14.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                  child: Row(
                    children: List.generate(placeImages.length, (index) {
                      String thumbnailImage = placeImages[index]['thumbnailImage']!;
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                            child: Image.network(
                              thumbnailImage,
                              height: 120.h,
                              width: 163.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (index != placeImages.length - 1)
                            SizedBox(width: 8.w),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 72.h,
          ),
        ],
      ),
    );
  }
}
