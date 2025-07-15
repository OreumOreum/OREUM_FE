import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;

  //final GlobalKey _tabBarKey = GlobalKey();

  const CustomTabBar({
    super.key,
    required this.tabs
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          // 배경 divider
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 2.h,
              color: AppColors.gray100,
            ),
          ),
          // TabBar with margin
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            child: TabBar(
              padding: EdgeInsets.zero,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              dividerHeight: 2.h,
              indicatorWeight: 0,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.h, color: AppColors.primary),
                borderRadius: BorderRadius.circular(2.r),
              ),
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.gray400,
              labelStyle: context.textStyles.label4.copyWith(
                fontFamily: 'PretendardVariable',
                color: AppColors.primary,
              ),
              unselectedLabelStyle: context.textStyles.label4.copyWith(
                fontFamily: 'PretendardVariable',
                color: AppColors.primary,
              ),
              indicatorColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.only(left: 10.w, right: 10.w, ),
              tabs: tabs,
            ),
          ),
        ],
      ),
    );
  }
}
