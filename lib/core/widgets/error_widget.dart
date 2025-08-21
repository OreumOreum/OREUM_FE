import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/image_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';

class ErrorRetryWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const ErrorRetryWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImagePath.error,
                    width: 191.w,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    '오류가 발생했습니다.',
                    style: context.textStyles.headLine1
                        .copyWith(color: AppColors.gray200),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    '잠시 후 다시 이용해주세요.',
                    style: context.textStyles.body1
                        .copyWith(color: AppColors.gray200),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16.h,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 56.h,
                child: CustomElevatedButton(
                    text: '다시 시도하기',
                    onPressed: onPressed,
                    textStyle: context.textStyles.label3
                        .copyWith(color: AppColors.white),
                    radius: AppSizes.radiusMD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
