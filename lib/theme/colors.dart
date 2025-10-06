import 'package:flutter/material.dart';

final class AppColors {
  static const color1 = Color(0xFF606C38);
  static const color2 = Color(0xFF283618);
  static const color3 = Color(0xFFFEFAE0);
  static const color4 = Color(0xFFDDA15E);
  static const color5 = Color(0xFFBC6C25);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const red = Color(0xFFE70000);
  static const green = Color(0xFF00E700);
  static const grey = Color(0xFF9E9E9E);
}

final appColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.color1,
  onPrimary: AppColors.white,
  secondary: AppColors.color2,
  onSecondary: AppColors.white,
  error: AppColors.red,
  onError: AppColors.white,
  surface: AppColors.color3,
  onSurface: AppColors.black,
);
