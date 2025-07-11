import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class HomeTitleText extends StatelessWidget {
  final String title;
  final String primaryText;
  final String subtitle;

  const HomeTitleText(
      {super.key,
      required this.title,
      required this.primaryText,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style:
                  context.textStyles.headLine4.copyWith(color: AppColors.gray500),
            ),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: primaryText, // 이 부분 색상 변경
                    style: context.textStyles.label4
                        .copyWith(color: AppColors.primary),
                  ),
                  TextSpan(
                    text: subtitle,
                    style: context.textStyles.body1
                        .copyWith(color: AppColors.gray300),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
