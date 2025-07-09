import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
}