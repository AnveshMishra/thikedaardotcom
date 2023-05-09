import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thikedaardotcom/config/styles/app_colors.dart';

final ThemeData lightTheme = ThemeData(
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.appAccentAmber),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
    ),
    primaryTextTheme: TextTheme(
        headlineLarge: TextStyle(
            color: AppColors.accentText,
            // fontFamily: nunito,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            color: AppColors.accentText,
            // fontFamily: nunito,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        headlineSmall: TextStyle(
            color: AppColors.accentText,
            // fontFamily: nunito,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(
            color: AppColors.accentText,
            // fontFamily: montserrat,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            color: AppColors.accentText,
            // fontFamily: montserrat,
            fontSize: 12.sp),
        bodyLarge: TextStyle(
            color: AppColors.accentText,
            // fontFamily: montserrat,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold)));
