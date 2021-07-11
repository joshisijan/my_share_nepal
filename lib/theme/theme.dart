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
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff534bae),
    selectionColor: Color(0xff534bae),
    selectionHandleColor: Color(0xff534bae),
  ),
);

ThemeData kCyanTheme = ThemeData.light().copyWith(
  primaryColor: Color(0xff006064),
  primaryColorDark: Color(0xff00363a),
  primaryColorLight: Color(0xff428e92),
  accentColor: Color(0xff006064),
  colorScheme: ColorScheme.light().copyWith(
    primary: Color(0xff006064),
    primaryVariant: Color(0xff00363a),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xff006064),
    secondaryVariant: Color(0xff00363a),
    onSecondary: Color(0xffffffff),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff428e92),
    selectionColor: Color(0xff428e92),
    selectionHandleColor: Color(0xff428e92),
  ),
);

ThemeData kBlueTheme = ThemeData.light().copyWith(
  primaryColor: Color(0xff0d47a1),
  primaryColorDark: Color(0xff002171),
  primaryColorLight: Color(0xff5472d3),
  accentColor: Color(0xff0d47a1),
  colorScheme: ColorScheme.light().copyWith(
    primary: Color(0xff0d47a1),
    primaryVariant: Color(0xff002171),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xff0d47a1),
    secondaryVariant: Color(0xff002171),
    onSecondary: Color(0xffffffff),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff5472d3),
    selectionColor: Color(0xff5472d3),
    selectionHandleColor: Color(0xff5472d3),
  ),
);

ThemeData kDeepPurpleTheme = ThemeData.light().copyWith(
  primaryColor: Color(0xff311b92),
  primaryColorDark: Color(0xff000063),
  primaryColorLight: Color(0xff6746c3),
  accentColor: Color(0xff311b92),
  colorScheme: ColorScheme.light().copyWith(
    primary: Color(0xff311b92),
    primaryVariant: Color(0xff000063),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xff311b92),
    secondaryVariant: Color(0xff000063),
    onSecondary: Color(0xffffffff),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff6746c3),
    selectionColor: Color(0xff6746c3),
    selectionHandleColor: Color(0xff6746c3),
  ),
);
