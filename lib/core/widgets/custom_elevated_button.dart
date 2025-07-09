import 'package:flutter/material.dart';

import 'package:oreum_fe/core/constants/app_colors.dart';

enum CustomElevatedButtonType {
  primary,
  secondary,
}

class CustomElevatedButton extends StatelessWidget {
  final CustomElevatedButtonType customElevatedButtonType;
  final String text;
  final VoidCallback? onPressed;
  final TextStyle textStyle;

  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.textStyle,
      this.customElevatedButtonType = CustomElevatedButtonType.primary});

  factory CustomElevatedButton.primary({
    required String text,
    required VoidCallback? onPressed,
    required TextStyle textStyle,
  }) =>
      CustomElevatedButton(
        text: text,
        onPressed: onPressed,
        textStyle: textStyle,
        customElevatedButtonType: CustomElevatedButtonType.primary,
      );

  factory CustomElevatedButton.secondary({
    required String text,
    required VoidCallback? onPressed,
    required TextStyle textStyle,
  }) =>
      CustomElevatedButton(
        text: text,
        onPressed: onPressed,
        textStyle: textStyle,
        customElevatedButtonType: CustomElevatedButtonType.secondary,
      );

  static WidgetStateProperty<Color?> _getBackgroundColor(
      Color enabledColor, disabledColor) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return disabledColor;
      }
      return enabledColor;
    });
  }

  static WidgetStateProperty<Color?> _getForegroundColor(
      Color enabledColor, disabledColor) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return disabledColor;
      }
      return enabledColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        customElevatedButtonType == CustomElevatedButtonType.primary
            ? AppColors.primary
            : AppColors.gray100;
    final foregroundColor =
        customElevatedButtonType == CustomElevatedButtonType.primary
            ? AppColors.white
            : AppColors.gray400;

    return ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor:
                _getBackgroundColor(backgroundColor, AppColors.gray100),
            foregroundColor:
                _getForegroundColor(foregroundColor, AppColors.gray200)),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ));
  }
}
