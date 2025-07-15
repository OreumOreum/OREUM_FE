import 'package:flutter/material.dart';
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
import 'package:oreum_fe/features/course/presentation/widgets/image_slider.dart';
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';

class TravelCourseScreen extends StatelessWidget {
  TravelCourseScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.backWithButtonAndText(
            title: '', onActionPressed: () {}, actionType: ActionType.dots),
        body: Column(
          children: [
            ImageSlider(images: courseImages),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
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
                      Text(
                        courseList[0]['title']!,
                          style:
                          context.textStyles.headLine3
                              .copyWith(color: AppColors.gray500)
                      ),
                      SizedBox(
                        height: 24.r,
                        width: 24.r,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            IconPath.bookmarkOutline,
                            width: 16.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                      courseList[0]['address']!,
                      style:
                      context.textStyles.body1
                          .copyWith(color: AppColors.gray400)
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      SvgPicture.asset(IconPath.star2),
                      SizedBox(width: 2.w),
                      Text(
                          courseList[0]['rating']!,
                          style:
                          context.textStyles.caption1
                              .copyWith(color: AppColors.gray200)
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        courseList[0]['reviewNumber']!,
                        style:
                        context.textStyles.caption1
                            .copyWith(color: AppColors.gray200)
                      )
                    ],
                  ),
                  SizedBox(height: 63.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24.w, 44.h, 0.w, 0.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray100),
                      borderRadius: BorderRadius.circular(8.r),),

                  )
                ],
              ),
            ),
          ],
        ));
  }
}
