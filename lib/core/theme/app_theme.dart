import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme { 
  static ThemeData dartTheme = ThemeData( 
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark, 
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textWhite),
    ),
    textTheme: const TextTheme (
      bodyLarge: TextStyle(color: AppColors.textWhite),
      bodyMedium: TextStyle(color: AppColors.textGrey),
    ), 
    cardColor: AppColors.cardDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryBlue,
      secondary: AppColors.primaryOrange,
    )
  );
}