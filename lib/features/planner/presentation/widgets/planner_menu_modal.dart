import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/core/widgets/modal_menu.dart';
import 'package:oreum_fe/core/widgets/name_editing_modal.dart';
import 'package:oreum_fe/features/planner/presentation/viewmodels/planner_list_view_model.dart';

class PlannerMenuModal extends ConsumerStatefulWidget {
  final String plannerId;
  final bool isDetail;

  const PlannerMenuModal({super.key, required this.plannerId, required this.isDetail});

  @override
  ConsumerState<PlannerMenuModal> createState() => _PlannerMenuModalState();
}

class _PlannerMenuModalState extends ConsumerState<PlannerMenuModal> {
  @override
  Widget build(BuildContext context) {
    final plannerListViewModel = ref.read(plannerListViewModelProvider.notifier);
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
                InkWell(
                  onTap: () {
                    context.pop();
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return NameEditingModal.plannerEdit(
                              plannerId: widget.plannerId);
                        });
                  },
                  child: ModalMenu(
                      title: AppStrings.changeName,
                      color: AppColors.gray400,
                      icon: IconPath.pencil,
                      iconHeight: 17.r,
                      iconWidth: 17.r),
                ),
                InkWell(
                  onTap: () async {
                    await plannerListViewModel.deletePlanner(widget.plannerId);
                    if(mounted && ref.read(plannerListViewModelProvider).buttonStatus == UiStatus.success) {
                      context.pop();
                      if(widget.isDetail) {
                        context.pop();
                      }
                      CustomToast.showToast(context, '일정이 삭제 되었습니다.', 16.h);
                    }
                  },
                  child: ModalMenu(
                      title: AppStrings.deletePlanner,
                      color: AppColors.gray400,
                      icon: IconPath.trashCan,
                      iconHeight: 15.r,
                      iconWidth: 12.r),
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
