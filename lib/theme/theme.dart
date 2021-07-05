import 'package:flutter/material.dart';
import 'package:my_share_nepal/theme/color.dart';

ThemeData kLightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
  primaryColorDark: kPrimaryDarkColor,
  primaryColorLight: kPrimaryLightColor,
  accentColor: kSecondaryColor,
  colorScheme: ColorScheme.light().copyWith(
    primary: kPrimaryColor,
    primaryVariant: kPrimaryDarkColor,
    onPrimary: kPrimaryTextColor,
    secondary: kSecondaryColor,
    secondaryVariant: kSecondaryDarkColor,
    onSecondary: kSecondaryTextColor,
  ),
);

ThemeData kDarkTheme = ThemeData.dark();
