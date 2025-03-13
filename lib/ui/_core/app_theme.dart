import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    elevatedButtonTheme: _elevatedButtonThemeData,
    appBarTheme: _appBarTheme,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.mainLightColor,
      ),
    ),
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    color: AppColors.backgroundColor,
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.mainColor.withAlpha(200);
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.mainColor.withAlpha(125);
          }
          return AppColors.mainColor;
        },
      ),
      foregroundColor: WidgetStatePropertyAll(Colors.black),
    ),
  );
}
