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
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';

class CustomScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const CustomScaffold({super.key, required this.navigationShell});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = widget.navigationShell.currentIndex;

    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar.logo(),
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.radiusSM),
            topRight: Radius.circular(AppSizes.radiusSM),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow100.withOpacity(0.25),
                offset: Offset(0, -4),
                blurRadius: 10.r)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.radiusSM),
            topRight: Radius.circular(AppSizes.radiusSM),
          ),
          child: BottomAppBar(
            padding: EdgeInsets.zero,
            height: kToolbarHeight.h,
            color: AppColors.white,
            child: Row(
              children: List.generate(4, (index) {
                final isActive = index == currentIndex;

                String iconPath;
                String label;
                double iconWidth;

                switch (index) {
                  case 0:
                    iconPath =
                        isActive ? IconPath.homeActivate : IconPath.homeDisable;
                    label = AppStrings.homeBottomAppBar;
                    iconWidth = 18.r;
                    break;
                  case 1:
                    iconPath = isActive
                        ? IconPath.plannerActivate
                        : IconPath.plannerDisable;
                    label = AppStrings.plannerBottomAppBar;
                    iconWidth = 14.r;
                    break;
                  case 2:
                    iconPath = isActive
                        ? IconPath.folderActivate
                        : IconPath.folderDisable;
                    label = AppStrings.folderBottomAppBar;
                    iconWidth = 14.r;
                    break;
                  case 3:
                    iconPath = isActive
                        ? IconPath.settingActivate
                        : IconPath.settingDisable;
                    label = AppStrings.settingBottomAppBar;
                    iconWidth = 20.r;
                    break;
                  default:
                    iconPath = '';
                    label = '';
                    iconWidth = 18.r;
                }

                return Expanded(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0 ? Radius.circular(AppSizes.radiusSM) : Radius.zero,
                      topRight: index == 3 ? Radius.circular(AppSizes.radiusSM) : Radius.zero,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topLeft: index == 0 ? Radius.circular(AppSizes.radiusSM) : Radius.zero,
                        topRight: index == 3 ? Radius.circular(AppSizes.radiusSM) : Radius.zero,
                      ),
                      onTap: () {
                        widget.navigationShell.goBranch(index);
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24.r,
                            width: 24.r,
                            child: Center(
                              child: SvgPicture.asset(
                                iconPath,
                                width: iconWidth,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            label,
                            style: context.textStyles.caption3.copyWith(
                              color:
                                  isActive ? AppColors.primary : AppColors.gray200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
