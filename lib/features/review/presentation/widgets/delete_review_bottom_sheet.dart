import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

import '../../../../core/constants/icon_path.dart';

class DeleteReviewBottomSheet extends StatelessWidget {
  final int reviewId;
  final VoidCallback onDeleteConfirm;

  const DeleteReviewBottomSheet({
    super.key,
    required this.reviewId,
    required this.onDeleteConfirm,
  });

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
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 13.h),
                    Container(
                      width: 42.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppColors.gray200,
                        borderRadius: BorderRadius.circular(AppSizes.radiusXXS),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // 바텀시트 닫기
                    onDeleteConfirm(); // 삭제 실행
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(6.w, 12.h, 6.w, 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: Center(
                                child: SvgPicture.asset(
                                    IconPath.trashCan,
                                    width: 12.w
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              AppStrings.deleteReview,
                              style: context.textStyles.body1
                                  .copyWith(color: AppColors.gray400),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.arrowRight,
                              width: 8.w,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}