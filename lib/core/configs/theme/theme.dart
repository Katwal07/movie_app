import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,

  colorScheme: ColorScheme.light(
    primary: primaryColor,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
    primaryContainer: primaryContainerColor,
    onPrimaryContainer: primaryContainerColor,
  ),

  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 25.sp,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    labelLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
      color: onSurfaceColor,
    ),
    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: onSurfaceColor,
    ),
    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: onSurfaceColor,
    ),
  ),
);