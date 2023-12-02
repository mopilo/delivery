library theme;

import 'package:delivery/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

part 'text_styles.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = AppColors.primary;
  const Color secondaryColor = AppColors.secondaryColor;

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: AppColors.red,
  );

  final themeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    cardColor: AppColors.white,
    colorScheme: colorScheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldColor,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: AppTextStyles.titleBold,
      titleMedium:  AppTextStyles.titleMedium,
      bodySmall: AppTextStyles.bodySmall,
      bodyMedium: AppTextStyles.bodyMedium,
    ),
    iconTheme: const IconThemeData(color: AppColors.black),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    popupMenuTheme: PopupMenuThemeData(
      position: PopupMenuPosition.under,
      elevation: 0.7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: AppColors.scaffoldColor,
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[500],
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.red,
      contentTextStyle:
      AppTextStyles.body2Regular.copyWith(color: AppColors.white),
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(52.r)),
        elevation: 0,
        backgroundColor: AppColors.primary,
        textStyle: AppTextStyles.body2Regular.copyWith(color: AppColors.white),
        padding: const EdgeInsets.all(12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle:
        AppTextStyles.body2Regular.copyWith(color: AppColors.primary),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: const BorderSide(color: AppColors.black),
      ),
      isDense: true,
      hintStyle: const TextStyle(fontSize: 16, color: AppColors.secondaryColor),
    ),
  );

  return themeData;
}