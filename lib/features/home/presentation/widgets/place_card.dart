import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/features/home/presentation/widgets/home_title_text.dart';

class PlaceCard extends StatelessWidget {
  final String title;
  final String type;
  final String category;
  final String? thumbnailImage;
  final VoidCallback onPressed;

  const PlaceCard({super.key,
    required this.title,
    required this.type,
    required this.category,
    required this.thumbnailImage,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(AppSizes.radiusXS),
        bottomRight: Radius.circular(AppSizes.radiusXS),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeTitleText(
            title: title,
            primaryText: type,
            subtitle: AppStrings.placeCardSubTitle(category),
          ),
          SizedBox(
            height: 10.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusXS),
            child: thumbnailImage == null
                ? Container(
                color: AppColors.gray200, height: 145.h, width: 250.w,)
                : Image.network(
              thumbnailImage!,
              height: 145.h,
              width: 250.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
