import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/error_widget.dart';
import 'package:oreum_fe/core/widgets/name_editing_modal.dart';
import 'package:oreum_fe/features/folder/data/models/folder_response.dart';
import 'package:oreum_fe/features/folder/domain/entities/folder_detail_arg.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_list_view_model.dart';
import 'package:oreum_fe/features/folder/presentation/widgets/folder_list_tile.dart';

class FolderListScreen extends ConsumerStatefulWidget {
  const FolderListScreen({super.key});

  @override
  ConsumerState<FolderListScreen> createState() => _FolderListScreenState();
}

class _FolderListScreenState extends ConsumerState<FolderListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(folderListViewModelProvider.notifier).getMyFolders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;
    final state = ref.watch(folderListViewModelProvider);

    if (state.status == UiStatus.loading) {
      return Padding(
        padding: EdgeInsets.only(bottom: 56.h),
        child: Center(child: Lottie.asset(AnimationPath.loading, repeat: true)),
      ); //로티
    }

    if (state.status == UiStatus.error) {
      return ErrorRetryWidget(
        onPressed: () {
          ref.read(folderListViewModelProvider.notifier).getMyFolders();
        },
      );
    }
    List<FolderResponse> folders = state.folders;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: AppColors.gray100,
            ),
            SizedBox(
              height: 36.h,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: StaggeredGrid.count(
                crossAxisCount: isWideScreen ? 4 : 2,
                crossAxisSpacing: 9.w,
                mainAxisSpacing: 32.h,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.radiusXS),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          builder: (context) {
                            return NameEditingModal.folderCreate();
                          });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.gray100,
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radiusXS),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                IconPath.addFolder,
                                width: 52.r,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Text(
                            AppStrings.addFolderButtonText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.label4
                                .copyWith(color: AppColors.gray300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(
                    folders.length,
                    (index) {
                      String folderId = folders[index].folderId.toString();
                      String folderName = folders[index].folderName;
                      List<String>? thumbnailImages =
                          folders[index].originImages;
                      bool isDefault = folders[index].isDefault;
                      return InkWell(
                        onTap: () {
                          context.push(RoutePath.folderDetail(folderId),
                              extra: FolderDetailArg(
                                  folderName: folderName,
                                  isDefault: isDefault));
                        },
                        child: FolderListTile(
                          title: folderName,
                          thumbnailImages: thumbnailImages,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
