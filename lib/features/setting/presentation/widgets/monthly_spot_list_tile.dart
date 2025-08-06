import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class MonthlySpotListTile extends StatelessWidget {
  final String thumbnailImage;
  final String title;
  final String address;
  final String sigungu;
  final bool isVisit;

  const MonthlySpotListTile(
      {super.key,
        required this.thumbnailImage,
        required this.title,
        required this.address,
        required this.isVisit,
        required this.sigungu,
      });

  @override
  Widget build(BuildContext context) {
    Widget circleContent;
    Color borderColor;
    double borderWidth;
    if (isVisit) {
      borderColor = AppColors.primary;
      borderWidth = 3.r;
      circleContent = SvgPicture.asset(
        IconPath.oreumStamp,

      );
    } else {
      borderColor = AppColors.gray200;
      borderWidth = 2.r;
      circleContent = Text(
        sigungu,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textStyles.caption1.copyWith(
          color: AppColors.gray300,
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: AppSizes.defaultPadding,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusXS),
            child: Image.network(
              thumbnailImage,
              height: 64.r,
              width: 64.r,
              fit: BoxFit.cover,
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
            width: 6.w,
          ),
          Container(
            width: 60.r,
            height: 60.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: borderColor, // 테두리색
                width: borderWidth,
              ),
            ),
            child: Center(
              child: circleContent,
            ),
          ),
        ],
      ),
    );
  }
}
