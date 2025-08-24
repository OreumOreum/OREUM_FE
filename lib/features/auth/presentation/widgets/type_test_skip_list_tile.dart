import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class TypeTestSkipListTile extends StatelessWidget {
  final String title;
  final List<String> tags;
  final String nickName;
  final bool isSelected;
  final String profile;

  const TypeTestSkipListTile(
      {super.key,
      required this.title,
      required this.tags,
      required this.nickName,
      required this.profile,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.gray200,
            width: 1.5.w),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.radiusMD),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 24.w),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textStyles.label1.copyWith(
                      color:
                          isSelected ? AppColors.primary : AppColors.gray600),
                ),
                Text(
                  nickName,
                  style: context.textStyles.body2
                      .copyWith(color: AppColors.gray300),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8.w,
                  children: tags.map((tag) {
                    return Text(
                      '#$tag',
                      style: context.textStyles.caption1
                          .copyWith(color: AppColors.gray300),
                    );
                  }).toList(),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 72.r,
              width: 72.r,
              child: CircleAvatar(
                backgroundColor: AppColors.gray100,
                child: Image.asset(
                  profile,
                  width: 72.r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
