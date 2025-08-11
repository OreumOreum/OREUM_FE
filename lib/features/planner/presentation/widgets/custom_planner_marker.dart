import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class CustomPlannerMarker extends StatelessWidget {
  final int index;

  const CustomPlannerMarker({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: 방문 여부(isVisited)에 따라 스타일을 다르게 할 수 있습니다.
    return SizedBox(
      height: 24.r,
      width: 24.r,
      child: CircleAvatar(
        backgroundColor: AppColors.primary,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: EdgeInsets.all(2.r),
            child: Text(
              index.toString(),
              style: context.textStyles.label2.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}