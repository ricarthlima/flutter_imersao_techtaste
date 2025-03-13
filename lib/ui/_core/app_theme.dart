import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    elevatedButtonTheme: _elevatedButtonThemeData,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
    ),
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
