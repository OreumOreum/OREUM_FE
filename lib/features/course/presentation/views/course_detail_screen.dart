import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/large_category.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/course/data/models/course_detail_response.dart';
import 'package:oreum_fe/features/course/presentation/viewmodels/course_detail_view_model.dart';
import 'package:oreum_fe/features/course/presentation/widgets/detail_container.dart';
import 'package:oreum_fe/features/course/presentation/widgets/image_slider.dart';
import 'package:oreum_fe/features/place/presentation/widgets/course_detail_list_tile.dart';

import '../../../../core/constants/animation_path.dart';
import '../../../../core/constants/content_type_id.dart';
import '../../../../core/constants/route_path.dart';
import '../../../../core/constants/ui_status.dart';
import '../../../../core/di/my_type_provider.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../home/presentation/widgets/course_card.dart';
import '../../../home/presentation/widgets/home_title_text.dart';
import '../../../review/data/models/review_response.dart';
import '../../../review/presentation/widgets/review_list_tile.dart';
import '../../data/models/course_response.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  final String courseId;
  final String contentId;
  final String contentTypeId;

  const CourseDetailScreen({super.key,
    required this.courseId,
    required this.contentId,
    required this.contentTypeId,
  });

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  bool isExpanded = false;
  bool _showExpandButton = false; // 더보기 버튼 표시 여부

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(courseDetailViewModelProvider(widget.courseId).notifier)
          .initializeCourseDetail(widget.courseId,widget.contentId, widget.contentTypeId);
    });
  }

  // 텍스트가 3줄을 넘는지 확인하는 함수
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

    final state = ref.watch(courseDetailViewModelProvider(widget.courseId));

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
        body:ErrorRetryWidget(
          onPressed: () {
            ref.read(courseDetailViewModelProvider(widget.courseId).notifier).initializeCourseDetail(widget.courseId, widget.contentId, widget.contentTypeId);
          },
        ),
      );
    }


    if (state.courseDetail == null) {
      return Scaffold(
        appBar: CustomAppBar.back(),
        body: const Center(
          child: Text('코스 정보를 불러올 수 없습니다.'),
        ),
      );
    }

    CourseDetailResponse course = state.courseDetail!;
    List<ReviewResponse> reviews = state.reviews;
    List<Place> places = course.places;
    List<CourseResponse> courses = state.courses;
    final myTypeState = ref.watch(myTravelTypeProvider);
    final myTravelType = myTypeState.myTravelType;
    final myTravelTypeLabel = myTravelType!.type;

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
                              Expanded(
                                child: Text(course.title,
                                    style: context.textStyles.headLine3
                                        .copyWith(color: AppColors.gray500)),
                              ),
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
                              Text(course.averageRate.toStringAsFixed(1),
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
                            isCourseMode: true,
                          ),
                          SizedBox(height: 56.h),

                          // 🔥 수정된 overview 부분
                          if (course.overview != null && course.overview!.isNotEmpty) ...[
                            Text(AppStrings.spotIntro,
                                style: context.textStyles.label3
                                    .copyWith(color: AppColors.gray500)),
                            SizedBox(height: 8.h),

                            // LayoutBuilder로 사용 가능한 너비 계산
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final textStyle = context.textStyles.body2.copyWith(color: AppColors.gray400);
                                final maxWidth = constraints.maxWidth;

                                // 텍스트가 3줄을 넘는지 확인
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  final shouldShowButton = _isTextOverflow(course.overview!, textStyle, maxWidth);
                                  if (_showExpandButton != shouldShowButton) {
                                    setState(() {
                                      _showExpandButton = shouldShowButton;
                                    });
                                  }
                                });

                                return Column(
                                  children: [
                                    Text(
                                      course.overview!,
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
                          // 🔥 overview 수정 끝

                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: places.length,
                      itemBuilder: (context, index) {
                        final dynamic place = places[index];

                        final contentType = ContentTypeId.fromContentTypeId(place.contentTypeId);
                        String category = contentType?.label ?? '여행지';

                        return CourseDetailListTile(
                            totalItemCount: places.length,
                            title: place.title,
                            address: place.address,
                            category: category,
                            thumbnailImage: place.thumbnailImage,
                            index: index + 1,
                            onTap: () {
                              context.push('${RoutePath.placeDetail}/${place.id}',
                                  extra: {
                                    'contentId': place.contentId,
                                    'contentTypeId': place.contentTypeId.toString()
                                  });
                            });
                      },
                      separatorBuilder: (context, index) {
                        final place1 = places[index];
                        final place2 = places[index + 1];

                        final Distance distance = Distance();
                        final double km = distance.as(
                          LengthUnit.Kilometer,
                          LatLng(place1.mapY, place1.mapX),
                          LatLng(place2.mapY, place2.mapX),
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
                              Row(
                                children: [
                                  Text(
                                    AppStrings.travelerReview,
                                    style: context.textStyles.label3
                                        .copyWith(color: AppColors.gray500),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    '${course.reviewCount.toString()}',
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
                          ref.read(courseDetailViewModelProvider(widget.courseId).notifier)
                              .refreshCourseDetailBackground(widget.courseId);
                        },);
                    },
                  ),
                ),

                if (reviews.isNotEmpty) ...[
                  SizedBox(height: 8.h,),
                  Divider(height: 1.h, color: AppColors.gray100),
                  SizedBox(height: 18.h,),
                ],

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
                              'originImage': state.courseDetail!.originImage,
                              'reviewCount': state.courseDetail!.reviewCount
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
              ],
            ),
          ),
        ));
  }
}