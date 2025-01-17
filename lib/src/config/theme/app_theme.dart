import 'package:flutter/material.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';

class AppTheme {
  String language;

  AppTheme(this.language);

  ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: ColorsManager.primary,
        onPrimary: ColorsManager.white,
        secondary: ColorsManager.secondary,
        onSecondary: ColorsManager.secondary,
        surface: ColorsManager.white,
        onSurface: ColorsManager.white,
        error: ColorsManager.primary,
        onError: ColorsManager.secondary,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: ColorsManager.lightBlack,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: ColorsManager.lightBlack,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: ColorsManager.lightBlack,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: ColorsManager.lightBlack,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: ColorsManager.lightBlack,
          fontSize: 12,
        ),
        titleSmall: TextStyle(
          color: ColorsManager.lightBlack,
          fontSize: 10,
        ),
      ),
      scaffoldBackgroundColor: ColorsManager.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFFF0000),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          fixedSize: Size(
            double.infinity,
            49,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: ColorsManager.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: ColorsManager.white,
          ), // Red
        ),
        labelStyle: TextStyle(
          color: ColorsManager.white,
        ),
        hintStyle: TextStyle(
          color: ColorsManager.primary,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: ColorsManager.primary,
          ), // Red
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.white,
        selectedItemColor: ColorsManager.primary,
        unselectedItemColor: ColorsManager.primary.withOpacity(0.5),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static TextStyle getTextStyle({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = "Roboto",
    required Color color,
    textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      decoration: textDecoration,
    );
  }
}
