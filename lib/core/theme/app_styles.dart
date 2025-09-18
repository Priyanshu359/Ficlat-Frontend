import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28, 
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );

  static const TextStyle heading2 = TextStyle (
    fontSize: 20, 
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.normal,
    color: AppColors.textGrey,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );
}