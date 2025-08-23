import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_tab_launcher.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/auth/presentation/widgets/custom_check_box.dart';

class TermsModal extends StatefulWidget {
  final VoidCallback onPressed;

  const TermsModal({super.key, required this.onPressed});

  @override
  State<TermsModal> createState() => _TermsModalState();
}

class _TermsModalState extends State<TermsModal> {
  bool isAgreeAll = false;
  bool isAgreeTerms = false;
  bool isAgreePrivacyPolicy = false;

  void _toggleAgreeAll() {
    setState(() {
      if (isAgreeAll) {
        isAgreeAll = false;
        isAgreeTerms = false;
        isAgreePrivacyPolicy = false;
      } else {
        isAgreeAll = true;
        isAgreeTerms = true;
        isAgreePrivacyPolicy = true;
      }
    });
  }

  void _updateActivateAll() {
    setState(() {
      isAgreeAll = isAgreeTerms && isAgreePrivacyPolicy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.w, sigmaY: 1.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSizes.radiusLG),
            ),
            color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '오름오름 앱 이용을 위한 약관 동의',
                        style: context.textStyles.headLine3
                            .copyWith(color: AppColors.gray500),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        '오름오름 서비스의 이용을 위하여 필수 약관 동의가 필요합니다.',
                        style: context.textStyles.body1
                            .copyWith(color: AppColors.gray300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: _toggleAgreeAll,
                        icon: (isAgreeTerms && isAgreePrivacyPolicy)
                            ? SvgPicture.asset(
                                IconPath.checkBoxOn,
                                width: 24.r,
                              )
                            : SvgPicture.asset(
                                IconPath.checkBoxOff,
                                width: 24.r,
                              ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        '약관에 전체동의',
                        style: context.textStyles.label3
                            .copyWith(color: AppColors.gray500),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.gray100,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0.5.r),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                InkWell(
                  onTap: () {
                    launchCustomTab(
                      context,
                      url:
                          'https://butternut-lens-9b9.notion.site/2527f270b082800faff2c6b3d867d95d',
                      title: '서비스 이용약관',
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomCheckbox(
                          isChecked: isAgreeTerms,
                          onChanged: (value) {
                            setState(() {
                              isAgreeTerms = value;
                              _updateActivateAll();
                            });
                          },
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          '오름오름 이용약관',
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.gray500),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          IconPath.arrowLink,
                          width: 24.r,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                InkWell(
                  onTap: () {
                    launchCustomTab(
                      context,
                      url:
                          'https://butternut-lens-9b9.notion.site/2097f270b082819d9bdfe6f21f2a4ef4',
                      title: '모닥불 개인정보 처리방침',
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomCheckbox(
                          isChecked: isAgreePrivacyPolicy,
                          onChanged: (value) {
                            setState(() {
                              isAgreePrivacyPolicy = value;
                              _updateActivateAll();
                            });
                          },
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          '오름오름 개인정보 처리방침',
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.gray500),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          IconPath.arrowLink,
                          width: 24.r,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 42.h,
                ),
                SizedBox(
                  height: 56.h,
                  width: double.infinity,
                  child: CustomElevatedButton(
                      text: '동의하고 계속하기',
                      onPressed: (isAgreeTerms && isAgreePrivacyPolicy)
                          ? widget.onPressed
                          : null,
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
      ),
    );
  }
}
