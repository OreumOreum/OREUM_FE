import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class ModalMenu extends StatelessWidget {
  final String title;
  final Color color;
  final String icon;
  final double iconHeight;
  final double iconWidth;

  const ModalMenu({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    required this.iconHeight,
    required this.iconWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: Row(
        children: [
          SizedBox(
            width: 6.w,
          ),
          SizedBox(
            width: 24.r,
            height: 24.r,
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: iconWidth,
                height: iconHeight,
              ),
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            title,
            style: context.textStyles.body1.copyWith(color: color),
          ),
          Spacer(),
          SizedBox(
            width: 6.w,
          ),
          SizedBox(
            width: 24.r,
            height: 24.r,
            child: Center(
              child: SvgPicture.asset(
                IconPath.arrowRight,
                width: 8.r,
                height: 12.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
