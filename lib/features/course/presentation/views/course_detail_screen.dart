import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/course/data/models/course_detail_response.dart';
import 'package:oreum_fe/features/course/presentation/viewmodels/course_detail_view_model.dart';
import 'package:oreum_fe/features/course/presentation/widgets/image_slider.dart';
import 'package:oreum_fe/features/course/presentation/widgets/detail_container.dart';
import 'package:oreum_fe/features/place/presentation/widgets/course_detail_list_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constants/route_path.dart';
import '../../../../core/constants/ui_status.dart';
import '../../../home/presentation/widgets/course_card.dart';
import '../../../home/presentation/widgets/home_title_text.dart';
import '../../../place/presentation/viewmodels/place_detail_view_model.dart';
import '../../../review/data/models/review_response.dart';
import '../../../review/presentation/widgets/review_list_tile.dart';
import '../../data/models/course_response.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  final String courseId;
  final String contentId;
  final String contentTypeId;

  CourseDetailScreen({super.key,
    required this.courseId,
    required this.contentId,
    required this.contentTypeId,
  });

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
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

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(courseDetailViewModelProvider.notifier)
          .initializeCourseDetail(widget.courseId,widget.contentId, widget.contentTypeId);
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(courseDetailViewModelProvider);

    if (state.status == UiStatus.loading) {
      return Scaffold(
        appBar: CustomAppBar.back(),
        body: const Center(
          child: CircularProgressIndicator(), //로티
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

    CourseDetailResponse course = state.courseDetail!;
    List<ReviewResponse> reviews = state.reviews;
    List<Place> places = course.places;
    List<CourseResponse> courses = state.courses;

    return Scaffold(
        appBar: CustomAppBar.back(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlider(image:course.originImage),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 14.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(IconPath.travelCourse),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(course.title,
                                  style: context.textStyles.headLine3
                                      .copyWith(color: AppColors.gray500)),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                              course.sigunguCode == 3
                                  ? '서귀포시 출발 코스'
                                  : course.sigunguCode == 4
                                  ? '제주시 출발 코스'
                                  : course.sigunguCode.toString(),
                              style: context.textStyles.body1
                                  .copyWith(color: AppColors.gray400)
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              SvgPicture.asset(IconPath.star2),
                              SizedBox(width: 2.w),
                              Text(course.averageRate.toString(),
                                  style: context.textStyles.caption1
                                      .copyWith(color: AppColors.gray200)),
                              SizedBox(width: 2.w),
                              Text('(${course.reviewCount.toString()})',
                                  style: context.textStyles.caption1
                                      .copyWith(color: AppColors.gray200))
                            ],
                          ),
                          SizedBox(height: 63.h),
                          DetailContainer(
                            tourData: state.tour,
                            isMapTabEnabled: false,
                          ),
                          SizedBox(height: 56.h),
                          Text(AppStrings.spotIntro,
                              style: context.textStyles.label3
                                  .copyWith(color: AppColors.gray500)),
                          SizedBox(height: 8.h),
                          Text(
                            course.overview != null ? course.overview! : '',
                            style: context.textStyles.body2.copyWith(color: AppColors.gray400),
                            maxLines: isExpanded ? null : 3,
                            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
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
                                      style: context.textStyles.body1.copyWith(color: AppColors.gray200)
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 48.h),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: places.length,
                      itemBuilder: (context, index) {
                        final dynamic place = places[index];
                        return CourseDetailListTile(
                            totalItemCount: places.length,
                            title: place.title,
                            address: place.address,
                            category: '한식',
                            thumbnailImage: place.thumbnailImage,
                            index: index + 1);
                      },
                      separatorBuilder: (context, index) {

                        final place1 = places[index];
                        final place2 = places[index + 1];

                        final Distance distance = Distance();
                        final double km = distance.as(
                          LengthUnit.Kilometer,
                          LatLng(place1.mapY!, place1.mapX!),
                          LatLng(place2.mapY!, place2.mapX!),
                        );

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: AppSizes.defaultPadding),
                          child: Text(
                            '${km.toStringAsFixed(1)}km',
                            style: context.textStyles.label4.copyWith(color: AppColors.gray200),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 48.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.travelerReview,
                                style: context.textStyles.label3
                                    .copyWith(color: AppColors.gray500),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.push('${RoutePath.createCourseReview}/${widget.courseId}',extra: {
                                    'name': state.courseDetail!.title,
                                    'originImage': state.courseDetail!.originImage
                                  });
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
                  ],
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

                // 리뷰가 3개 초과일 때만 전체보기 버튼 표시
                if (reviews.length > 3)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            context
                                .push('${RoutePath.reviewCourseDetail}/${widget.courseId}', extra: {
                              'name': state.courseDetail!.title,
                              'rate': state.courseDetail!.averageRate,
                              'originImage': state.courseDetail!.originImage
                            });
                          },
                          child: Text(
                              '전체보기',
                              style: context.textStyles.body1.copyWith(color: AppColors.gray200)
                          )
                      ),
                    ],
                  ),
                if (reviews.length > 3) SizedBox(height: 48.h),
                SizedBox(height: 48.h),
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
              ],
            ),
          ),
        ));
  }
}