import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';

import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class RecentSearchListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  const RecentSearchListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          SizedBox(
            height: AppSizes.iconSM,
            width: AppSizes.iconSM,
            child: Center(
              child: SvgPicture.asset(
                IconPath.clock,
                width: 16.r,
                height: 16.r,
              ),
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
            child: Text(
              title,
              style: context.textStyles.body1.copyWith(color: AppColors.gray200),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          SizedBox(
            height: AppSizes.iconSM,
            width: AppSizes.iconSM,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onDelete,
              icon: SvgPicture.asset(
                IconPath.searchCancel,
                width: 10.r,
                height: 10.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
