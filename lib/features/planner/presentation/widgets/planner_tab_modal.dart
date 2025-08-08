import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/core/widgets/modal_menu.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_detail_view_model.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_list_view_model.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/states/folder_detail_state.dart';
import 'package:oreum_fe/core/widgets/name_editing_modal.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_edit_view_model.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_list_view_model.dart';

class PlannerTabModal extends ConsumerStatefulWidget {
  final int tabLength;

  const PlannerTabModal(
      {super.key,
      required this.tabLength});

  @override
  ConsumerState<PlannerTabModal> createState() => _PlannerTabModalState();
}

class _PlannerTabModalState extends ConsumerState<PlannerTabModal> {
  @override
  Widget build(BuildContext context) {
    final plannerEditViewModel =
        ref.read(plannerEditViewModelProvider.notifier);
    return SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.w, sigmaY: 1.h),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLG)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 14.h,
                ),
                Container(
                  width: 42.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: AppColors.gray200),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.tabLength,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        plannerEditViewModel.removeTab(index);
                        context.pop();
                      },
                      child: ModalMenu(
                          title: '${index + 1}일 차 삭제',
                          color: AppColors.gray400,
                          icon: IconPath.trashCan,
                          iconHeight: 15.r,
                          iconWidth: 12.r),
                    );
                  },
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
