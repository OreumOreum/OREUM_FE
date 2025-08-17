import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/utils/string_utils.dart';
import 'package:oreum_fe/core/widgets/custom_toast.dart';

class EmailErrorDialog extends StatelessWidget {
  const EmailErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.w, sigmaY: 1.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        ),
        width: 296.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 32.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '불편을 드려 죄송합니다.',
                style: context.textStyles.headLine3
                    .copyWith(color: AppColors.gray600),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                StringUtils().wordBreaks(
                    '현재 기본 메일 앱을 사용할 수 없어, 아래 이메일로 문의 내용을 보내주시면 오름오름 고객센터에서 확인 후 신속히 답변드리겠습니다.'),
                style:
                    context.textStyles.body2.copyWith(color: AppColors.gray200),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Text(
                    '📩 이메일: zzarit.kr@gmail.com',
                    style: context.textStyles.label4
                        .copyWith(color: AppColors.gray500),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 24.r,
                    width: 24.r,
                    child: IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: 'zzarit.kr@gmail.com'),
                        );
                        CustomToast.showToast(context, '복사가 완료 되었습니다.', 56.h);
                      },
                      icon: SvgPicture.asset(IconPath.copy),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 38.h,
              ),
              SizedBox(
                height: 48.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.gray100),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppSizes.radiusMD), // 원하는 radius 값
                          ),
                        ),
                      ),
                  child: Text(
                    '확인',
                    style: context.textStyles.label3
                        .copyWith(color: AppColors.gray400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
