  import 'dart:ui';

  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:oreum_fe/core/constants/app_colors.dart';
  import 'package:oreum_fe/core/constants/app_sizes.dart';
  import 'package:oreum_fe/core/constants/app_strings.dart';
  import 'package:oreum_fe/core/themes/app_text_styles.dart';
  import 'package:oreum_fe/core/themes/text_theme_extension.dart';
  import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';

  class FolderCreateModal extends StatelessWidget {
    const FolderCreateModal({super.key});

    @override
    Widget build(BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.w, sigmaY: 1.h),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLG)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  AppStrings.addFolder,
                  style: context.textStyles.body1.copyWith(color: AppColors.primary),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextField(
                  cursorColor: AppColors.secondary,
                  style: context.textStyles.label3.copyWith(color: AppColors.gray500),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: AppStrings.addFolderHintText,
                    hintStyle:
                        context.textStyles.label3.copyWith(color: AppColors.gray200),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                  ),
                ),
                Container(
                  height: 1.h,
                  decoration: BoxDecoration(
                    color: AppColors.gray100,
                    borderRadius: BorderRadius.circular(1.r), // 줄 자체를 둥글게
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                SizedBox(
                  height: 56.h,
                  width: double.infinity,
                  child: CustomElevatedButton(
                      text: AppStrings.addFolderButtonText,
                      onPressed: () {},
                      textStyle: context.textStyles.label3,
                      radius: AppSizes.radiusMD),
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
