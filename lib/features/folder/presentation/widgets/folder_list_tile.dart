import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class FolderListTile extends StatelessWidget {
  final String title;
  final List<String>? thumbnailImages;

  const FolderListTile({super.key, required this.title, required this.thumbnailImages});

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
              color: AppColors.gray200,
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
          color: AppColors.gray200,
          borderRadius: BorderRadius.circular(AppSizes.radiusXS),
        ),
      );
    }

    // 사진이 4개 이하면 첫 번째 사진만 표시
    if (thumbnailImages!.length < 4) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusXS),
        child: Image.network(
          thumbnailImages![0],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.gray200,
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
          return Image.network(
            thumbnailImages![index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.gray200,
              );
            },
          );
        },
      ),
    );
  }
}
