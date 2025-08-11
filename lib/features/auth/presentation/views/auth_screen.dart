import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:oreum_fe/features/auth/data/services/apple_auth_service.dart';
import 'package:oreum_fe/features/auth/presentation/viewmodels/auth_view_model.dart';
import 'package:oreum_fe/features/auth/presentation/viewmodels/states/auth_state.dart';
import 'package:oreum_fe/features/auth/presentation/widgets/guide_box.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.read(authViewModelProvider.notifier);
    return Scaffold(
      appBar: CustomAppBar.logoCenter(),
      body: SafeArea(
        child: Padding(
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
                GuideBox(text: AppStrings.socialLoginGuide),
                SizedBox(height: 14.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        authViewModel.loginWithKakao();
                      },
                      icon: SvgPicture.asset(
                        IconPath.kakao,
                        width: 52.r,
                      ),
                    ),
                    SizedBox(
                      width: 24.h,
                    ),
                    if (Platform.isIOS) ...[
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          authViewModel.loginWithApple();
                        },
                        icon: SvgPicture.asset(
                          IconPath.apple,
                          width: 52.r,
                        ),
                      ),
                      SizedBox(
                        width: 24.h,
                      ),
                    ],
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        authViewModel.loginWithGoogle();
                      },
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
      ),
    );
  }
}
