import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.c_091227,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.c_091227,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.c_091227,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      //display
      displayLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 57.sp,
          fontWeight: FontWeight.w800,
          fontFamily: "Gilroy"),
      displayMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Gilroy"),
      displaySmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Gilroy"),
      //headline
      headlineLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Gilroy"),
      headlineMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Gilroy"),
      headlineSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Gilroy"),
      //title
      titleLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Gilroy"),
      titleMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Gilroy"),
      titleSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Gilroy"),
      //label
      labelLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Gilroy"),
      labelMedium: TextStyle(
          color: AppColors.passiveTextColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Gilroy"),
      labelSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Gilroy"),
      //body
      bodySmall: const TextStyle(
          color: AppColors.passiveTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Gilroy"),
      bodyMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Gilroy"),
      bodyLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Gilroy"),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}