import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_detail_view_model.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_list_view_model.dart';

enum NameEditStatus {
  folderCreate,
  folderEdit,
  plannerCreate,
}

class NameEditingModal extends ConsumerStatefulWidget {
  final NameEditStatus editStatus;
  final String? folderId;

  const NameEditingModal._({
    super.key,
    required this.editStatus,
    this.folderId,
  });

  factory NameEditingModal.folderCreate() => const NameEditingModal._(
    editStatus: NameEditStatus.folderCreate,
  );

  factory NameEditingModal.folderEdit({required String folderId}) => NameEditingModal._(
    editStatus: NameEditStatus.folderEdit,
    folderId: folderId,
  );

  factory NameEditingModal.plannerCreate() => const NameEditingModal._(
    editStatus: NameEditStatus.plannerCreate,
  );
  bool get isFolderEditMode => folderId != null;

  @override
  ConsumerState<NameEditingModal> createState() => _NameEditingModalState();
}

class _NameEditingModalState extends ConsumerState<NameEditingModal> {
  final TextEditingController _textEditingController = TextEditingController();

  bool get isFolderEditMode => widget.editStatus == NameEditStatus.folderEdit;
  bool get isFolderCreateMode => widget.editStatus == NameEditStatus.folderCreate;
  bool get isPlannerCreateMode => widget.editStatus == NameEditStatus.plannerCreate;

  String get titleText {
    switch (widget.editStatus) {
      case NameEditStatus.folderCreate:
        return AppStrings.addFolder;
      case NameEditStatus.folderEdit:
        return AppStrings.editFolder;
      case NameEditStatus.plannerCreate:
        return AppStrings.addPlan;
    }
  }

  String get buttonText {
    switch (widget.editStatus) {
      case NameEditStatus.folderCreate:
        return AppStrings.addFolderButtonText;
      case NameEditStatus.folderEdit:
        return AppStrings.editFolderButtonText;
      case NameEditStatus.plannerCreate:
        return AppStrings.addPlanner;
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final folderListState = ref.watch(folderListViewModelProvider);
    final folderListViewModel = ref.read(folderListViewModelProvider.notifier);
    final folderDetailState = ref.watch(folderDetailViewModelProvider);
    final folderDetailViewModel =
        ref.read(folderDetailViewModelProvider.notifier);
    final isCreateLoading = folderListState.buttonStatus == UiStatus.loading;
    final isEditLoading = folderDetailState.buttonStatus == UiStatus.loading;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text(
                    titleText,
                  style: context.textStyles.body1
                      .copyWith(color: AppColors.primary),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextField(
                  controller: _textEditingController,
                  cursorColor: AppColors.secondary,
                  style: context.textStyles.label3
                      .copyWith(color: AppColors.gray500),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: AppStrings.addFolderHintText,
                    hintStyle: context.textStyles.label3
                        .copyWith(color: AppColors.gray200),
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
                      text: buttonText,
                      onPressed: isCreateLoading || isEditLoading
                          ? null
                          : () async {
                              String name = _textEditingController.text.trim();
                              if (name.isNotEmpty) {
                                switch (widget.editStatus) {
                                  case NameEditStatus.folderCreate:
                                    await folderListViewModel.createMyFolder(name);
                                    if (mounted &&
                                        ref.read(folderListViewModelProvider).buttonStatus == UiStatus.success) {
                                      context.pop();
                                    }
                                    break;

                                  case NameEditStatus.folderEdit:
                                    await folderDetailViewModel.editMyFolder(widget.folderId!, name);
                                    folderDetailViewModel.updateFolderName(name);
                                    if (mounted &&
                                        ref.read(folderDetailViewModelProvider).buttonStatus == UiStatus.success) {
                                      context.pop();
                                    }
                                    break;
                                  case NameEditStatus.plannerCreate:
                                    context.push('${RoutePath.planner}/edit', extra: name);
                                    context.pop();
                                }
                              }
                            },
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
