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
import 'package:oreum_fe/core/widgets/custom_search_bar.dart';

enum AppBarType {
  logo,
  logoCenter,
  logoWithButton,
  back,
  backWithButtonAndText,
  backWithTextButtonAndText,
  backWithSearchBar,
}

enum ActionType {
  dots,
  plus,
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarType type;
  final VoidCallback? onActionPressed;
  final String? title;
  final String? buttonText;
  final ActionType? actionType;
  final double? actionIconWidth;
  final TextEditingController? searchController;

  const CustomAppBar({
    super.key,
    required this.type,
    this.onActionPressed,
    this.title,
    this.buttonText,
    this.actionType,
    this.actionIconWidth,
    this.searchController,
  });

  factory CustomAppBar.logo() => CustomAppBar(
        type: AppBarType.logo,
      );

  factory CustomAppBar.logoCenter() => CustomAppBar(
        type: AppBarType.logoCenter,
      );

  factory CustomAppBar.logoWithButton(
          {required String buttonText,
          required VoidCallback onActionPressed}) =>
      CustomAppBar(
        type: AppBarType.logoWithButton,
        buttonText: buttonText,
        onActionPressed: onActionPressed,
      );

  factory CustomAppBar.back() => CustomAppBar(type: AppBarType.back);

  factory CustomAppBar.backWithButtonAndText(
          {required String title,
          required ActionType actionType,
          required VoidCallback onActionPressed}) =>
      CustomAppBar(
        type: AppBarType.backWithButtonAndText,
        title: title,
        actionType: actionType,
        onActionPressed: onActionPressed,
      );

  factory CustomAppBar.backWithTextButtonAndText(
          {required String title, required VoidCallback onActionPressed}) =>
      CustomAppBar(
        type: AppBarType.backWithTextButtonAndText,
        title: title,
        onActionPressed: onActionPressed,
      );

  factory CustomAppBar.backWithSearchBar({required TextEditingController controller}) =>
      CustomAppBar(type: AppBarType.backWithSearchBar,searchController: controller);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppBarType.logo:
        return AppBar(
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            IconPath.appIconAppBar,
            width: 74.w,
          ),
        );
      case AppBarType.logoCenter:
        return AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            IconPath.appIconAppBar,
            width: 74.w,
          ),
        );
      case AppBarType.logoWithButton:
        return AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            IconPath.appIconAppBar,
            width: 74.w,
          ),
          actions: [
            TextButton(
              onPressed: onActionPressed,
              child: Text(
                buttonText!,
                style:
                    context.textStyles.body1.copyWith(color: AppColors.gray200),
              ),
            ),
            SizedBox(
              width: AppSizes.defaultPadding,
            ),
          ],
        );
      case AppBarType.back:
        return AppBar(
          leading: Row(
            children: [
              SizedBox(
                width: AppSizes.defaultPadding,
              ),
              SizedBox(
                height: AppSizes.iconSM,
                width: AppSizes.iconSM,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    context.pop();
                  },
                  icon: SvgPicture.asset(
                    IconPath.backAppBar,
                    width: 11.r,
                  ),
                ),
              ),
            ],
          ),
        );
      case AppBarType.backWithButtonAndText:
        return AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: -10.w,
          leading: Row(
            children: [
              SizedBox(
                width: AppSizes.defaultPadding,
              ),
              SizedBox(
                height: AppSizes.iconSM,
                width: AppSizes.iconSM,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    context.pop();
                  },
                  icon: SvgPicture.asset(
                    IconPath.backAppBar,
                    width: 11.r,
                  ),
                ),
              )
            ],
          ),
          title: Text(
            title!,
            style: context.textStyles.label3.copyWith(color: AppColors.gray400),
          ),
          actions: [
            SizedBox(
              height: AppSizes.iconSM,
              width: AppSizes.iconSM,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: onActionPressed,
                icon: _buildIcon(actionType!),
              ),
            ),
            SizedBox(
              width: AppSizes.defaultPadding,
            ),
          ],
        );
      case AppBarType.backWithTextButtonAndText:
        return AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: -10.w,
          leading: Row(
            children: [
              SizedBox(
                width: AppSizes.defaultPadding,
              ),
              SizedBox(
                height: AppSizes.iconSM,
                width: AppSizes.iconSM,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    context.pop();
                  },
                  icon: SvgPicture.asset(
                    IconPath.backAppBar,
                    width: 11.r,
                  ),
                ),
              )
            ],
          ),
          title: Text(
            title!,
            style: context.textStyles.label3.copyWith(color: AppColors.gray400),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.save,
                style: context.textStyles.label4
                    .copyWith(color: AppColors.primary),
              ),
            ),
            SizedBox(
              width: AppSizes.defaultPadding,
            ),
          ],
        );
      case AppBarType.backWithSearchBar:
        return AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 8.w,
          leadingWidth: AppSizes.defaultPadding + AppSizes.iconSM,
          leading: Row(
            children: [
              SizedBox(
                width: AppSizes.defaultPadding,
              ),
              SizedBox(
                height: AppSizes.iconSM,
                width: AppSizes.iconSM,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    context.pop();
                  },
                  icon: SvgPicture.asset(
                    IconPath.backAppBar,
                    width: 11.r,
                  ),
                ),
              )
            ],
          ),
          title: Row(
            children: [

              Expanded(
                  child: CustomSearchBar(
                controller: searchController!,
              )),

              SizedBox(
                width: 6.w,
              )
            ],
          ),
        );
    }
  }

  Widget _buildIcon(ActionType type) {
    switch (type) {
      case ActionType.dots:
        return SvgPicture.asset(IconPath.dots, width: 16.r);
      case ActionType.plus:
        return SvgPicture.asset(IconPath.plus, width: 16.r);
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
