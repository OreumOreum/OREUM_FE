import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/image_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class CourseDetailListTile extends StatelessWidget {
  final int index;
  final String category;
  final String address;
  final String title;
  final String? thumbnailImage;
  final int totalItemCount;

  const CourseDetailListTile({super.key,
    required this.title,
    required this.address,
    required this.category,
    required this.thumbnailImage,
    required this.index,
    required this.totalItemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 23.h, bottom: 7.h, left: 21.h, right: 14.h),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 24.r,
                width: 24.r,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Text(
                    index.toString(),
                    style: context.textStyles.label2.copyWith(
                        color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 11.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: context.textStyles.label1
                      .copyWith(color: AppColors.primary),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  title,
                  style: context.textStyles.headLine4
                      .copyWith(color: AppColors.gray500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  address,
                  style:
                  context.textStyles.body1.copyWith(color: AppColors.gray400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                child: thumbnailImage != null ? Image.network(
                  thumbnailImage!,
                  width: 84.r,
                  height: 84.r,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Container(
                      width: 84.r,
                      height: 84.r,
                      color: AppColors.gray100,
                      child: Center(
                        child: Image.asset(
                          ImagePath.imageError,
                          width: 52.r,
                        ),
                      ),
                    );
                  },
                ) : Container(
                  width: 84.r,
                  height: 84.r,
                  color: AppColors.gray100,
                  child: Center(
                    child: Image.asset(
                      ImagePath.imageError,
                      width: 64.r,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
