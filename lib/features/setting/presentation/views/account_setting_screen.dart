import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

import 'package:oreum_fe/core/widgets/custom_app_bar.dart';

import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';

import '../../../../core/constants/icon_path.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.back(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    AppStrings.manageAccount,
                    style: context.textStyles.label3
                        .copyWith(color: AppColors.gray500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                GestureDetector(
                  onTap: () {
                    print('유형재검사 터치');
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              AppStrings.retakeTypeTest,
                              style: context.textStyles.body1
                                  .copyWith(color: AppColors.gray400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            SizedBox(
                              width: 24.r,
                              height: 24.r,
                              child: Center(
                                child: SvgPicture.asset(
                                  IconPath.expand,
                                  width: 7.w,
                                  height: 12.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppColors.gray100,
                ),
                GestureDetector(
                  onTap: () {
                    print('내가쓴 리뷰 터치');
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.viewMyReviews,
                          style: context.textStyles.body1
                              .copyWith(color: AppColors.gray400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        SizedBox(
                          width: 24.r,
                          height: 24.r,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.expand,
                              width: 7.w,
                              height: 12.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppColors.gray100,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    print('탈퇴하기 터치');
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 6.w, vertical: 10.h),
                    child: Text(
                      AppStrings.deleteAccount,
                      style: context.textStyles.body2
                          .copyWith(color: AppColors.gray200),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
