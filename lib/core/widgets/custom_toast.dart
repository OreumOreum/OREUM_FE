import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class CustomToast {
  static void showToast(BuildContext context, String message, double bottom,) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    bool isVisible = true;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        bottom: bottom,
        child: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: StatefulBuilder(
              builder: (context, setState) {
                return AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300), // 페이드 아웃 시간
                  onEnd: () {
                    if (!isVisible) overlayEntry.remove();
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(41.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow200.withOpacity(0.25),
                            blurRadius: 10.r,
                            spreadRadius: 0,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(IconPath.exclamationMarkCircle ,width: 18.r,),
                          SizedBox(width: 8.w,),
                          Text(
                            message,
                            style: context.textStyles.label4.copyWith(color: AppColors.primary),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

    // Overlay에 추가
    overlay.insert(overlayEntry);

    // 지정된 시간 후에 서서히 사라짐
    Future.delayed(const Duration(seconds: 1), () {
      isVisible = false; // opacity를 0으로 설정
      overlayEntry.markNeedsBuild(); // Overlay 업데이트
    });
  }
}