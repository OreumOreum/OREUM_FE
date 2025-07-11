import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/image_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class SplitRoundedButton extends StatelessWidget {
  const SplitRoundedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXS),
        color: AppColors.gray100,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.radiusXS),
                bottomLeft: Radius.circular(AppSizes.radiusXS),
              ),
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImagePath.tangerine,
                    width: 18.r,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    AppStrings.jejuCityRecommendation,
                    style: context.textStyles.body1
                        .copyWith(color: AppColors.gray500),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 15.h,
            width: 1.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.r),
                color: AppColors.gray200),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSizes.radiusXS),
                bottomRight: Radius.circular(AppSizes.radiusXS),
              ),
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImagePath.mountain,
                    width: 18.r,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    AppStrings.seogwipoCityRecommendation,
                    style: context.textStyles.body1
                        .copyWith(color: AppColors.gray500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
