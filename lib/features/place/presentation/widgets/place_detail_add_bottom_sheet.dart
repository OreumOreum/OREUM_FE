import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_elevated_button.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_detail_view_model.dart';
import 'package:oreum_fe/features/place/presentation/viewmodels/place_detail_add_view_model.dart';

import '../../../../core/constants/icon_path.dart';
import '../../../../core/constants/image_path.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../core/widgets/name_editing_modal.dart';
import '../../../folder/data/models/folder_saved_response.dart';
import '../viewmodels/place_detail_view_model.dart';
import '../viewmodels/states/place_detail_add_state.dart';

class PlaceDetailAddBottomSheet extends ConsumerStatefulWidget {
  final String? originImage;
  final String title;
  final int id;
  final String? folderId;

  const PlaceDetailAddBottomSheet({
    super.key,
    required this.originImage,
    required this.title,
    required this.id,
    this.folderId,
  });

  @override
  ConsumerState<PlaceDetailAddBottomSheet> createState() =>
      _PlaceDetailAddBottomSheetState();
}

class _PlaceDetailAddBottomSheetState
    extends ConsumerState<PlaceDetailAddBottomSheet> {
  bool _hasChanges = false;
  bool _isBookmarkDeleted = false;
  bool _wasAlreadySaved = false;

  @override
  void initState() {
    super.initState();
    _wasAlreadySaved = true;

    Future.microtask(() {
      ref
          .read(placeDetailAddViewModelProvider.notifier)
          .initializeBottomSheet(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(placeDetailAddViewModelProvider);

    return GestureDetector(
        onTap: () {
          // 🔥 바깥쪽 터치 시 바텀시트 닫기
          if (_isBookmarkDeleted) {
            Navigator.of(context).pop(false);
          } else if (_hasChanges) {
            Navigator.of(context).pop(true);
          } else if (_wasAlreadySaved) {
            Navigator.of(context).pop(true);
          } else {
            Navigator.of(context).pop(null);
          }
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.w, sigmaY: 1.h),
          child: GestureDetector(
            onTap: () {}, // 바텀시트 내부 터치는 무시 (이벤트 전파 중단)
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSizes.radiusLG),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.h),
                              Container(
                                width: 42.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: AppColors.gray200,
                                  borderRadius:
                                  BorderRadius.circular(AppSizes.radiusXXS),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.radiusXS),
                                      child: Image.network(
                                        widget.originImage ?? '',
                                        height: 64.r,
                                        width: 64.r,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            height: 64.r,
                                            width: 64.r,
                                            color: AppColors.gray100,
                                            child: Center(
                                              child: Image.asset(
                                                ImagePath.imageError,
                                                width: 32.r,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.title,
                                          style: context.textStyles.headLine4
                                              .copyWith(color: AppColors.gray500),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(AppStrings.isSaved,
                                            style: context.textStyles.body1
                                                .copyWith(
                                                color: AppColors.gray300)),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () async {
                                      await ref
                                          .read(placeDetailViewModelProvider(
                                          widget.id.toString())
                                          .notifier)
                                          .deleteDefaultFolder(widget.id);
                                      if(widget.folderId != null) {
                                      await ref.read(folderDetailViewModelProvider.notifier).refreshMyFolderPlacesBackground(widget.folderId!);}

                                      if (mounted) {
                                        _isBookmarkDeleted =
                                        true; // 🔥 북마크 삭제 플래그 설정
                                        Navigator.of(context).pop(false);
                                        CustomToast.showToast(
                                            context, '모든 폴더에서 삭제되었습니다.', 56.h);
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      IconPath.bookmarkFill,
                                      width: 16.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 21.h),
                    Divider(height: 1.h, color: AppColors.gray100),
                    SizedBox(height: 22.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppStrings.folder,
                                  style: context.textStyles.headLine4
                                      .copyWith(color: AppColors.gray500)),
                              TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return NameEditingModal
                                            .folderCreatePlaceDetail(
                                            placeId: widget.id);
                                      });
                                },
                                child: Text(
                                  AppStrings.addFolderButtonText,
                                  style: context.textStyles.label4
                                      .copyWith(color: AppColors.gray300),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 18.h),
                          _buildFolderList(state),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  Widget _buildFolderList(PlaceDetailAddState state) {
    if (state.status == UiStatus.loading) {
      return Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (state.status == UiStatus.error) {
      return Center(
        child: Column(
          children: [
            Text(
              '오류가 발생했습니다.',
              style: context.textStyles.headLine1.copyWith(
                color: AppColors.gray200,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              '잠시 후 다시 이용해주세요',
              style: context.textStyles.body1.copyWith(
                color: AppColors.gray200,
              ),
            ),
            SizedBox(height: 14.h),

            // 다시 시도하기 버튼
            TextButton(
              onPressed: () {
                ref
                    .read(placeDetailAddViewModelProvider.notifier)
                    .initializeBottomSheet(widget.id);
              },
              child: Text(
                '다시 시도하기',
                style: context.textStyles.label2.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (state.folders.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '폴더가 없습니다',
              style: TextStyle(color: AppColors.gray400),
            ),
          ),
        ),
      );
    }

    List<FolderSavedResponse> folders = state.folders;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: folders.length > 3 ? 200.h : double.infinity,
      ),
      child: ListView.builder(
        physics: folders.length <= 3
            ? NeverScrollableScrollPhysics()
            : ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: state.folders.length,
        itemBuilder: (context, index) {
          final folder = folders[index];

          return Padding(
            padding: EdgeInsets.only(
                bottom: index == state.folders.length - 1 ? 30.h : 20.h),
            child: GestureDetector(
              onTap: () async {
                if (folder.isSaved) {
                  // 폴더에서 제거
                  await ref
                      .read(placeDetailAddViewModelProvider.notifier)
                      .deletePlaceFromFolder(widget.id, folder.folderId);

                  // 🔥 "모든 저장됨" 기본 폴더인 경우 추가 처리
                  if (folder.folderName == '모든 저장됨') {
                    // 기본 폴더에서 제거되면 북마크도 함께 해제
                    await ref
                        .read(placeDetailViewModelProvider(widget.id.toString())
                        .notifier)
                        .deleteDefaultFolder(widget.id);

                    if(widget.folderId != null) {
                      await ref.read(folderDetailViewModelProvider.notifier).refreshMyFolderPlacesBackground(widget.folderId!);}

                    if (mounted) {
                      _isBookmarkDeleted = true; // 북마크 삭제 플래그 설정
                      Navigator.of(context).pop(false);
                      CustomToast.showToast(context, '모든 폴더에서 삭제되었습니다.', 56.h);
                      return; // 바텀시트 닫으므로 여기서 종료
                    }
                  }

                  _hasChanges = true; // 변경사항 표시
                } else {
                  // 폴더에 추가
                  await ref
                      .read(placeDetailAddViewModelProvider.notifier)
                      .addPlaceToFolder(widget.id, folder.folderId);

                  // 🔥 "모든 저장됨" 기본 폴더인 경우 추가 처리
                  if (folder.folderName == '모든 저장됨') {
                    // 기본 폴더에 추가되면 북마크도 함께 활성화
                    await ref
                        .read(placeDetailViewModelProvider(widget.id.toString())
                        .notifier)
                        .addDefaultFolder(widget.id);
                  }

                  if(widget.folderId != null) {
                    await ref.read(folderDetailViewModelProvider.notifier).refreshMyFolderPlacesBackground(widget.folderId!);}

                  _hasChanges = true; // 변경사항 표시
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(folder.folderName,
                        style: context.textStyles.label4
                            .copyWith(color: AppColors.gray400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Center(
                      child: SvgPicture.asset(
                        folder.isSaved ? IconPath.saveCheck : IconPath.savePlus,
                        width: 12.w,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}