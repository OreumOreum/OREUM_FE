import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/image_path.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/routes/app_router.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/auth/presentation/widgets/guide_box.dart';

class TypeTestStartScreen extends StatelessWidget {
  const TypeTestStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.logoWithButton(
          buttonText: AppStrings.skip, onActionPressed: () {
            context.push(RoutePath.typeTestSkip);
      }),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 45.h,
                ),
                GuideBox(text: AppStrings.typeTestStartGuide),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  AppStrings.typeTestStartTitle,
                  textAlign: TextAlign.center,
                  style: context.textStyles.headLine2
                      .copyWith(color: AppColors.gray600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  AppStrings.typeTestStartDescription,
                  style: context.textStyles.body1
                      .copyWith(color: AppColors.gray500),
                ),
                SizedBox(
                  height: 57.h,
                ),
                Image.asset(
                  ImagePath.banner,
                  width: 219.w,
                ),
                Spacer(),
                SizedBox(
                  height: 56.h,
                  width: double.infinity,
                  child: CustomElevatedButton.primary(
                    text: AppStrings.typeTestStartText,
                    onPressed: () => context.push(RoutePath.typeTest),
                    textStyle: context.textStyles.label3,
                    radius: AppSizes.radiusMD,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
