import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/constants/image_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_cache_manager.dart';
import 'package:oreum_fe/features/folder/presentation/viewmodels/folder_detail_view_model.dart';

class FolderDetailListTile extends ConsumerWidget {
  final String title;
  final String? thumbnailImage;
  final int folderId;
  final int placeId;

  const FolderDetailListTile(
      {super.key,
      required this.title,
      required this.thumbnailImage,
      required this.folderId,
      required this.placeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                  child: thumbnailImage == null
                      ? Container(
                          color: AppColors.gray100,
                          child: Center(
                            child: Image.asset(
                              ImagePath.imageError,
                              width: 74.r,
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: thumbnailImage!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          cacheManager: CustomCacheManager(),
                          errorWidget: (context, url, error) {
                            return Container(
                              color: AppColors.gray100,
                              child: Center(
                                child: Image.asset(
                                  ImagePath.imageError,
                                  width: 74.r,
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 12.h,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: SvgPicture.asset(IconPath.bookmarkFill),
                    onPressed: () async {
                      await ref
                          .read(folderDetailViewModelProvider.notifier)
                          .deleteFolderPlace(folderId, placeId);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.label4.copyWith(color: AppColors.gray600),
          ),
        ),
      ],
    );
  }
}
