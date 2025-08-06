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

class FolderMenuModal extends ConsumerStatefulWidget {
  final String folderId;

  const FolderMenuModal({super.key, required this.folderId});

  @override
  ConsumerState<FolderMenuModal> createState() => _FolderMenuModalState();
}

class _FolderMenuModalState extends ConsumerState<FolderMenuModal> {
  @override
  Widget build(BuildContext context) {
    final folderDetailState = ref.watch(folderDetailViewModelProvider);
    final folderDetailViewModel = ref.read(folderDetailViewModelProvider.notifier);
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
                          return NameEditingModal.folderEdit(
                              folderId: widget.folderId);
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
                    await folderDetailViewModel.deleteMyFolder(widget.folderId);
                    if(mounted && ref.read(folderDetailViewModelProvider).buttonStatus == UiStatus.success) {
                      context.pop();
                      context.pop();
                      CustomToast.showToast(context, '폴더가 삭제 되었습니다.', 16.h);
                    }
                  },
                  child: ModalMenu(
                      title: AppStrings.deleteFolder,
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
