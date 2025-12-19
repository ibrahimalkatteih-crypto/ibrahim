import 'package:delivary_ecomers/core/constant/colorApp.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  // primarySwatch: Colors.blue,
  fontFamily: 'Cairo',
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[50],
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Cairo',
      color: ColorApp.seconryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: ColorApp.seconryColor, size: 20),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorApp.pblack,
    ),
    bodyLarge: TextStyle(fontSize: 17, height: 2, color: ColorApp.gray),
  ),
);

ThemeData themeArabic = ThemeData(
  // primarySwatch: Colors.blue,
  fontFamily: 'Cairo',
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[50],
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Cairo',
      color: ColorApp.seconryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: ColorApp.seconryColor, size: 20),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorApp.pblack,
    ),
    bodyLarge: TextStyle(fontSize: 17, height: 2, color: ColorApp.gray),
  ),
);
