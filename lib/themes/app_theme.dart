import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/themes/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(height: 50.h),
    fontFamily: 'SF Pro Text',
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF1F295A),
      iconTheme: const IconThemeData(
        color: Colors.red,
      ),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1F295A),
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1F295A)),
      headline2: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1F295A),
      ),
      headline3: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0x0046dd99),
      ),
      headline4: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1F295A),
      ),
      headline5: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1F295A),
      ),
      headline6: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: const Color(0xFF1F295A),
      ),
      button: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
      bodyText1: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
        .copyWith(secondary: AppColors.accent),
  );
}
