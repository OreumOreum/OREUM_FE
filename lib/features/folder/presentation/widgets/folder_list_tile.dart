import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/image_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_cache_manager.dart';

class FolderListTile extends StatelessWidget {
  final String title;
  final List<String>? thumbnailImages;

  const FolderListTile(
      {super.key, required this.title, required this.thumbnailImages});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
            ),
            child: _buildContent(),
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

  Widget _buildContent() {
    // 사진이 null이거나 비어있으면 회색 배경
    if (thumbnailImages == null || thumbnailImages!.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.gray100,
          borderRadius: BorderRadius.circular(AppSizes.radiusXS),
        ),
        child: Image.asset(
          ImagePath.imageError,
          width: 74.r,
        ),
      );
    }

    // 사진이 4개 이하면 첫 번째 사진만 표시
    if (thumbnailImages!.length < 4) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusXS),
        child: CachedNetworkImage(
          imageUrl: thumbnailImages![0],
          fit: BoxFit.cover,
          cacheManager: CustomCacheManager(),
          errorWidget: (context, url, error) {
            return Container(
              color: AppColors.gray100,
              child: Image.asset(
                ImagePath.imageError,
                width: 74.r,
              ),
            );
          },
        ),
      );
    }

    // 사진이 4개 초과면 2x2 그리드로 표시
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radiusXS),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: thumbnailImages![index],
            fit: BoxFit.cover,
            cacheManager: CustomCacheManager(),
            errorWidget: (context, error, stackTrace) {
              return Container(
                color: AppColors.gray100,
                child: Image.asset(
                  ImagePath.imageError,
                  width: 74.r,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
