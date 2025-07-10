import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/image_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.logoCenter(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 71.h,
              ),
              Image.asset(
                ImagePath.banner,
                width: 219.w,
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                AppStrings.bannerTitle,
                textAlign: TextAlign.center,
                style: context.textStyles.headLine2.copyWith(
                  color: AppColors.gray600,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppStrings.bannerDescription,
                style:
                    context.textStyles.body1.copyWith(color: AppColors.gray300),
              ),
              Spacer(),
              Container(
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
                    AppStrings.socialLoginTitle,
                    style: context.textStyles.caption1
                        .copyWith(color: AppColors.gray400),
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      IconPath.kakao,
                      width: 52.r,
                    ),
                  ),
                  SizedBox(
                    width: 24.h,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      IconPath.apple,
                      width: 52.r,
                    ),
                  ),
                  SizedBox(
                    width: 24.h,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      IconPath.google,
                      width: 52.r,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 42.h,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.socialLoginButtonText,
                  style: context.textStyles.caption1.copyWith(
                      color: AppColors.gray200,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.gray200),
                ),
              ),
              SizedBox(
                height: 42.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
