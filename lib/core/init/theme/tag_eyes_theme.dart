// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TagEyesTheme {
  static final defaultTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xffFFCC52),
      secondary: Color(0xffFEC127),
      error: Colors.red,
      primaryContainer: Color(0xff564E46),
      //primary: Color(0xffA2F2C5),
      //secondary: Color(0xFF082B59),
      inversePrimary: Color(0xFFF2F5F4),
      //error: Color(0xfffcb064),
      tertiary: Color(0xff4ab1b3),
      tertiaryContainer: Color(0xFFED6B5E),
      onTertiary: Color(0xfffcb064),
      //primaryContainer: Color(0xfff8f4f4),
    ),
    appBarTheme: const AppBarTheme(
        toolbarHeight: 65,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black),
        color: Color(0xFFFAFAFA),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black)),
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 12.0,
        color: Color(0xff564E46),
        fontFamily: "Urbanist",
      ),
    ),
    tabBarTheme: const TabBarTheme(labelColor: Colors.black, indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFCC52)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(const Color(0xffFEC127)),
      ),
    ),
    textTheme: const TextTheme(
      button: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Color(0xff564E46),
        fontFamily: "Urbanist",
      ),
      headline1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w100,
        color: Color(0xff564E46),
        fontFamily: "NotoSansGrantha",
      ),
      headline2: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "Urbanist",
      ),
      subtitle1: TextStyle(
        fontSize: 12.0,
        color: Colors.black,
        fontFamily: "Urbanist",
      ),
      bodyText1: TextStyle(
        fontSize: 11.0,
        color: Colors.black,
        fontFamily: "Urbanist",
      ),
    ),
  );
}
