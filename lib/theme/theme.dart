import 'package:flutter/material.dart';

ThemeData kDarkTheme = ThemeData.dark();

ThemeData kIndigoTheme = ThemeData.light().copyWith(
  primaryColor: Color(0xff1a237e),
  primaryColorDark: Color(0xff000051),
  primaryColorLight: Color(0xff534bae),
  accentColor: Color(0xff1a237e),
  colorScheme: ColorScheme.light().copyWith(
    primary: Color(0xff1a237e),
    primaryVariant: Color(0xff000051),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xff1a237e),
    secondaryVariant: Color(0xff000051),
    onSecondary: Color(0xffffffff),
  ),
);

ThemeData kRedTheme = ThemeData.light().copyWith(
  primaryColor: Color(0xffb71c1c),
  primaryColorDark: Color(0xff7f0000),
  primaryColorLight: Color(0xfff05545),
  accentColor: Color(0xffb71c1c),
  colorScheme: ColorScheme.light().copyWith(
    primary: Color(0xffb71c1c),
    primaryVariant: Color(0xff7f0000),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xffb71c1c),
    secondaryVariant: Color(0xff7f0000),
    onSecondary: Color(0xffffffff),
  ),
);

ThemeData kPurpleTheme = ThemeData.light().copyWith(
  primaryColor: Color(0xff880e4f),
  primaryColorDark: Color(0xff560027),
  primaryColorLight: Color(0xffbc477b),
  accentColor: Color(0xff880e4f),
  colorScheme: ColorScheme.light().copyWith(
    primary: Color(0xff880e4f),
    primaryVariant: Color(0xff560027),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xff880e4f),
    secondaryVariant: Color(0xff560027),
    onSecondary: Color(0xffffffff),
  ),
);
