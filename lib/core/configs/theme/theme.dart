import 'package:flutter/material.dart';
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
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: onSurfaceColor,
    ),
    labelLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: onSurfaceColor,
    ),
    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: onSurfaceColor,
    ),
    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: onSurfaceColor,
    ),
  ),
);

//   //! Light Elevated Button Theme
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//     elevation: 0,
//     foregroundColor: Colors.white,
//     backgroundColor: primaryColor,
//     // disabledForegroundColor: AppColor.buttonDisabled,
//     // disabledBackgroundColor: AppColor.buttonDisabled,
//     side: const BorderSide(color: Colors.blue),
//     padding: const EdgeInsets.symmetric(vertical: 18),
//     textStyle: const TextStyle(
//         fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   )),
// );

// var darkTheme = ThemeData(
//   brightness: Brightness.dark,

//   //! Dark Color Theme
//   colorScheme: ColorScheme.dark(
//     primary: darkPrimaryColor,
//     surface: darkSurfaceColor,
//     onSurface: darkOnSurfaceColor,
//     primaryContainer: darkSecondaryColor,
//   ),

//   //! Dark Text Theme
//   textTheme: TextTheme(
//     headlineMedium: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 25,
//       fontWeight: FontWeight.w500,
//       color: darkOnSurfaceColor,
//     ),
//     headlineSmall: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 20,
//       fontWeight: FontWeight.w500,
//       color: darkOnSurfaceColor,
//     ),
//     bodyLarge: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 20,
//       fontWeight: FontWeight.w500,
//       color: darkOnSurfaceColor,
//     ),
//     bodyMedium: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 15,
//       fontWeight: FontWeight.w500,
//       color: darkOnSurfaceColor,
//     ),
//     bodySmall: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 11,
//       fontWeight: FontWeight.w500,
//       color: darkOnSurfaceColor,
//     ),
//     labelLarge: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 24,
//       fontWeight: FontWeight.w400,
//       color: darkOnSurfaceColor,
//     ),
//     labelMedium: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 20,
//       fontWeight: FontWeight.w400,
//       color: darkOnSurfaceColor,
//     ),
//     labelSmall: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: darkOnSurfaceColor,
//     ),
//   ),

//   //! Dark Elevated Button Theme
//   elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//     elevation: 0,
//     foregroundColor: Colors.white,
//     backgroundColor: primaryColor,
//     // disabledForegroundColor: AppColor.buttonDisabled,
//     // disabledBackgroundColor: AppColor.buttonDisabled,
//     side: const BorderSide(color: Colors.blue),
//     padding: const EdgeInsets.symmetric(vertical: 18),
//     textStyle: const TextStyle(
//         fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   )),
// );
