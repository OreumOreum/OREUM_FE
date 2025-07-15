import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
import 'package:oreum_fe/features/home/presentation/widgets/course_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_card.dart';
import 'package:oreum_fe/features/home/presentation/widgets/place_list_tile.dart';
import 'package:oreum_fe/features/home/presentation/widgets/split_rounded_button.dart';
import 'package:oreum_fe/main.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';

class CreateReviewScreen extends StatelessWidget {
  CreateReviewScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.back(),
      body: Column(
        children: [
          SizedBox(height: 56.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      mockPlace2[1]['thumbnailImage']!, // 첫 번째 이미지
                      height: 84.r,
                      width: 84.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    mockPlace2[1]['title']!,
                    style: context.textStyles.headLine4
                        .copyWith(color: AppColors.gray500),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    mockPlace2[1]['address']!,
                    style: context.textStyles.body1
                        .copyWith(color: AppColors.gray400),
                  ),
                  SizedBox(height: 24.h),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 27.w,
                    itemPadding: EdgeInsets.symmetric(horizontal: 6.w),
                    itemBuilder: (context, _) => SvgPicture.asset(
                      IconPath.star,
                    ),
                    unratedColor: AppColors.gray200,
                    onRatingUpdate: (rating) {
                      // 별점 업데이트 로직
                    },
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Divider(height: 2.h, color: AppColors.gray100),
          SizedBox(height: 56.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 18.w),
              Text(
                AppStrings.writeReview,
                style: context.textStyles.label4
                    .copyWith(color: AppColors.gray500),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Container(
              width: double.infinity,
              height: 153.h,
              padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.gray100, // 배경색
              ),
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppStrings.writeDetailReview,
                  hintStyle: context.textStyles.body2
                      .copyWith(color: AppColors.gray200),
                ),
                style:
                    context.textStyles.body2.copyWith(color: AppColors.gray400),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '0자 / 300자',
                style: context.textStyles.caption1
                    .copyWith(color: AppColors.primary),
              ),
              SizedBox(width: 18.w)
            ],
          ),
          SizedBox(height: 93.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
              height: 56.h,
              width: double.infinity,
              child: CustomElevatedButton.primary(
                  text: AppStrings.writeReviewButton,
                  onPressed: () {},
                  textStyle: context.textStyles.label3, radius: AppSizes.radiusMD),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
