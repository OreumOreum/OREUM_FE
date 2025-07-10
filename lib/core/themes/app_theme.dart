import 'package:flutter/material.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData kThemeData = ThemeData(
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.secondary,
      cardColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,

      ///textTheme: textTheme,
      fontFamily: 'PretendardVariable',
      appBarTheme: kAppAppBarTheme,
      bottomSheetTheme: kBottomSheetThemeData,
      elevatedButtonTheme: kElevatedButtonThemeData,
      iconButtonTheme: kIconButtonThemeData,
      textButtonTheme: kTextButtonThemeData,
      useMaterial3: true,
      bottomNavigationBarTheme: kBottomNavigationBarThemeData);

  ///Appbar 테마
  static AppBarTheme kAppAppBarTheme = AppBarTheme(
    color: AppColors.white,
    scrolledUnderElevation: 0,
    titleSpacing: AppSizes.defaultPadding,
  );

  ///BottomSheet 테마
  static BottomSheetThemeData kBottomSheetThemeData = BottomSheetThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.radiusLG))),
    backgroundColor: AppColors.white,
  );

  ///ElevatedButton 테마
  static ElevatedButtonThemeData kElevatedButtonThemeData =
  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        ),
      ));

  ///IconButton 테마
  static IconButtonThemeData kIconButtonThemeData = IconButtonThemeData(
    style: ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: WidgetStatePropertyAll(EdgeInsets.zero),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
    ),
  );

  ///TextButton 테마
  static TextButtonThemeData kTextButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      overlayColor: Colors.transparent,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );

  ///BottomNavigationBar 테마
  static BottomNavigationBarThemeData kBottomNavigationBarThemeData =
  BottomNavigationBarThemeData(
      elevation: 0, backgroundColor: AppColors.white);
}