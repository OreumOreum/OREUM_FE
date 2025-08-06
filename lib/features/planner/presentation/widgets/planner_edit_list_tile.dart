import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_edit_view_model.dart';

class PlannerEditListTile extends ConsumerWidget {
  final String category;
  final String title;
  final String? address;
  final int index;
  final int day;


  const PlannerEditListTile(
      {super.key,
      required this.day,
      required this.category,
      required this.title,
      required this.address,
      required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            ref.read(plannerEditViewModelProvider.notifier).removePlace(day, index);
          },
          icon: SvgPicture.asset(
            IconPath.deleteSign,
            width: 24.r,
          ),
        ),
        SizedBox(
          width: 8.h,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: 18.h, horizontal: AppSizes.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4.h),
                    color: AppColors.shadow200.withOpacity(0.25),
                    blurRadius: 10,
                    spreadRadius: 0),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: context.textStyles.label1
                            .copyWith(color: AppColors.primary),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        title,
                        style: context.textStyles.headLine4
                            .copyWith(color: AppColors.gray500),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        address != null ? address! : '',
                        style: context.textStyles.body1
                            .copyWith(color: AppColors.gray400),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.r, width: 32.r, child: ReorderableDragStartListener(
                  index: index,
                  child: SvgPicture.asset(IconPath.arrowUpDown, width: 12.r,),
                ),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
