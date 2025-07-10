import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class GuideBox extends StatelessWidget {
  final String text;
  const GuideBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusLG),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withOpacity(0.25),
              offset: Offset(0, 4.h),
              blurRadius: 10,
              spreadRadius: 0,
            )
          ]),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 36.w, vertical: 8.w),
        child: Text(
          text,
          style: context.textStyles.caption1
              .copyWith(color: AppColors.gray400),
        ),
      ),
    );
  }
}
