import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';

class ReviewListTile extends StatelessWidget {
  final String type;
  final String date;
  final String content;
  final double rating;

  const ReviewListTile(
      {super.key,
        required this.type,
        required this.date,
        required this.content,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: rating,
                    ignoreGestures: true,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 18.w,
                    itemBuilder: (context, _) => SvgPicture.asset(
                      IconPath.star2,
                    ),
                    unratedColor: AppColors.gray200,
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(width: 6.w),
                  Text('4',
                  style: context.textStyles.label3
        .copyWith(color: AppColors.primary),)
                ],
              ),
              SvgPicture.asset(IconPath.dots)
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppStrings.reviewName(type),
                style: context.textStyles.label4
                    .copyWith(color: AppColors.gray500),),
              SizedBox(width: 6.w),
              Text(AppStrings.reviewDate(date),
                style: context.textStyles.label4
                    .copyWith(color: AppColors.gray200),),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: context.textStyles.body2
            .copyWith(color: AppColors.gray400),
          ),
          SizedBox(height: 8.h),
          Divider(height: 1.h, color: AppColors.gray100),
        ],
      ),
    );
  }
}
