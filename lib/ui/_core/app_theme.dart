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
        color: AppColors.mainLightColor,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.mainLightColor,
      ),
    ),
    inputDecorationTheme: _inputDecorationTheme,
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 1,
        color: Colors.white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 1,
        color: AppColors.mainLightColor,
      ),
    ),
    focusColor: AppColors.mainLightColor,
    filled: true,
    fillColor: Colors.grey[900],
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    color: AppColors.backgroundColor,
    centerTitle: true,
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

  static ButtonStyle iconButtonStylized = ButtonStyle(
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
  );
}
