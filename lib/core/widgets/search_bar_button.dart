import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

import '../constants/route_path.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: WidgetStatePropertyAll(AppColors.gray100),
            ),
        onPressed: () {
          context.push(RoutePath.search);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          child: Row(
            children: [
              SizedBox(
                height: AppSizes.iconSM,
                width: AppSizes.iconSM,
                child: Center(
                  child: SvgPicture.asset(
                    IconPath.search,
                    width: 18.w,
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                AppStrings.searchBarHintText,
                style:
                    context.textStyles.body1.copyWith(color: AppColors.gray200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
