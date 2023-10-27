import 'package:fake_store/core/palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const textThemes = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Palette.black1),
    displayMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Palette.black1),
    displaySmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w500, color: Palette.black1),
    headlineLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: Palette.black1),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Palette.primaryColor1),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Palette.black1),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Palette.black1),
  );
  static final themeData = ThemeData(
      primaryColor: Palette.primaryColor1,
      scaffoldBackgroundColor: Palette.backgroundColor,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Palette.lightBlackTextColor),
      textTheme: textThemes,
      tabBarTheme: TabBarTheme(
        labelColor: Palette.primaryColor1, // color for text

        overlayColor: MaterialStateProperty.all(
          Palette.primaryColor1,
        ),
      ));
}
