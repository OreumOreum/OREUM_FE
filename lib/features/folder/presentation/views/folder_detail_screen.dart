import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:oreum_fe/core/constants/animation_path.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/route_path.dart';
import 'package:oreum_fe/core/constants/ui_status.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';
import 'package:oreum_fe/core/widgets/error_widget.dart';
import 'package:oreum_fe/core/widgets/modal_menu.dart';
import 'package:oreum_fe/features/folder/data/models/folder_detail_response.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_detail_view_model.dart';
import 'package:oreum_fe/features/folder/presentation/widgets/folder_detail_list_tile.dart';
import 'package:oreum_fe/features/folder/presentation/widgets/folder_menu_modal.dart';

class FolderDetailScreen extends ConsumerStatefulWidget {
  final String folderId;
  final String folderName;
  final bool isDefault;

  FolderDetailScreen(
      {super.key,
      required this.folderId,
      required this.folderName,
      required this.isDefault});

  @override
  ConsumerState<FolderDetailScreen> createState() => _FolderDetailScreenState();
}

class _FolderDetailScreenState extends ConsumerState<FolderDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(folderDetailViewModelProvider.notifier)
          .getMyFolderPlaces(widget.folderId);
      ref
          .read(folderDetailViewModelProvider.notifier)
          .initFolderName(widget.folderName);
    });
  }

  void showFolderUpdateModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FolderMenuModal(
          folderId: widget.folderId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(folderDetailViewModelProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    if (state.status == UiStatus.loading) {
      return Scaffold(
        appBar: widget.isDefault
            ? CustomAppBar.backWithText(
                title: state.folderName != null
                    ? state.folderName!
                    : widget.folderName,
              )
            : CustomAppBar.backWithButtonAndText(
                title: state.folderName != null
                    ? state.folderName!
                    : widget.folderName,
                actionType: ActionType.dots,
                onActionPressed: () {
                  showFolderUpdateModal(context);
                }),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 56.h),
            child: Center(
              child: Lottie.asset(AnimationPath.loading, repeat: true),
            ),
          ),
        ),
      );
    }

    if (state.status == UiStatus.error) {
      return Scaffold(
        appBar: widget.isDefault
            ? CustomAppBar.backWithText(
                title: state.folderName != null
                    ? state.folderName!
                    : widget.folderName,
              )
            : CustomAppBar.backWithButtonAndText(
                title: state.folderName!,
                actionType: ActionType.dots,
                onActionPressed: () {
                  showFolderUpdateModal(context);
                }),
        body: ErrorRetryWidget(
          onPressed: () {
            ref
                .read(folderDetailViewModelProvider.notifier)
                .getMyFolderPlaces(widget.folderId);
            ref
                .read(folderDetailViewModelProvider.notifier)
                .initFolderName(widget.folderName);
          },
        ),
      );
    }

    List<FolderDetailResponse> folderPlaces = state.folderPlaces;
    logger.i('isDefault: ${widget.isDefault}');

    return Scaffold(
      appBar: widget.isDefault
          ? CustomAppBar.backWithText(
              title: state.folderName != null
                  ? state.folderName!
                  : widget.folderName,
            )
          : CustomAppBar.backWithButtonAndText(
              title: state.folderName != null
                  ? state.folderName!
                  : widget.folderName,
              actionType: ActionType.dots,
              onActionPressed: () {
                showFolderUpdateModal(context);
              }),
      body: SafeArea(
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
                child: folderPlaces.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Center(
                          child: Text(
                            '아직 관광지가 없습니다.',
                            style: context.textStyles.headLine1
                                .copyWith(color: AppColors.gray300),
                          ),
                        ),
                      )
                    : StaggeredGrid.count(
                        crossAxisCount: isWideScreen ? 4 : 2,
                        crossAxisSpacing: 9.w,
                        mainAxisSpacing: 32.h,
                        children: List.generate(
                          folderPlaces.length,
                          (index) {
                            String title = folderPlaces[index].placeTitle;
                            String? thumbnailImage =
                                folderPlaces[index].originImage;
                            String placeId = folderPlaces[index].placeId.toString();
                            String contentId = folderPlaces[index].contentId;
                            String contentTypeId = folderPlaces[index].contentTypeId;
                            return InkWell(
                              onTap: () {
                                context.push('${RoutePath.placeDetail}/$placeId',
                                    extra: {
                                      'contentId': contentId,
                                      'contentTypeId': contentTypeId
                                    });
                              },
                              child: FolderDetailListTile(
                                  folderId: folderPlaces[index].FolderId,
                                  placeId: folderPlaces[index].placeId,
                                  title: title,
                                  thumbnailImage: thumbnailImage),
                            );
                          },
                        ),
                      ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
