import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_edit_view_model.dart';

class PlannerSearchListTile extends ConsumerWidget {
  final int day;
  final String placeId;
  final String title;
  final String? address;
  final String? thumbnailImage;

  const PlannerSearchListTile(
      {super.key,
        required this.day,
        required this.placeId,
        required this.title,
        required this.address,
        this.thumbnailImage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.defaultPadding, vertical: 14.h),
      child: Row(
        children: [
          Container(
            width: 64.r,
            height: 64.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                color: AppColors.gray100),
            child: thumbnailImage != ''
                ? ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              child: Image.network(
                thumbnailImage!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox.shrink();
                },
              ),
            )
                : SizedBox.shrink(),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.textStyles.label1
                      .copyWith(color: AppColors.gray500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  address ?? '',
                  style: context.textStyles.body1
                      .copyWith(color: AppColors.gray300),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            height: 28.h,
            width: 56.w,
            child: CustomElevatedButton.secondary(
              text: AppStrings.select,
              onPressed: () {
                print('클릭');
                ref.read(plannerEditViewModelProvider.notifier).addPlace(day, placeId, title, address);
                context.pop();
              },
              textStyle: context.textStyles.label4,
              radius: AppSizes.radiusXS,
            ),
          ),
        ],
      ),
    );
  }
}