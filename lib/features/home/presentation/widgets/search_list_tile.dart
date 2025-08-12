import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/custom_cache_manager.dart';

import '../../../../core/constants/image_path.dart';

class SearchListTile extends StatelessWidget {
  final String? thumbnailImage;
  final String title;
  final String address;

  const SearchListTile({
    super.key,
    this.thumbnailImage,
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: AppSizes.defaultPadding,
      ),
      child: Row(
        children: [
          Container(
            height: 84.r,
            width: 84.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                color: AppColors.gray100),
            child: thumbnailImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                    child: CachedNetworkImage(
                      cacheManager: CustomCacheManager(),
                      imageUrl: thumbnailImage!,
                      fit: BoxFit.cover,
                      errorWidget: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.gray100,
                          child: Center(
                            child: Image.asset(
                              ImagePath.imageError,
                              width: 52.r,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(
              color: AppColors.gray100,
              child: Center(
                child: Image.asset(
                  ImagePath.imageError,
                  width: 52.r,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textStyles.label1
                      .copyWith(color: AppColors.gray500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      address,
                      style: context.textStyles.body1
                          .copyWith(color: AppColors.gray300),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    SizedBox(
                      height: 24.r,
                      width: 24.r,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          IconPath.bookmarkOutline,
                          width: 16.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
