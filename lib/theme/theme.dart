import 'package:flutter/material.dart';

final kThemeColorMap = [
  {
    'primaryColor': Color(0xff1a237e),
    'primaryColorDark': Color(0xff000051),
    'primaryColorLight': Color(0xff534bae),
    'onPrimary': Color(0xffffffff),
  },
  {
    'primaryColor': Color(0xff006064),
    'primaryColorDark': Color(0xff00363a),
    'primaryColorLight': Color(0xff428e92),
    'onPrimary': Color(0xffffffff),
  },
  {
    'primaryColor': Color(0xff0d47a1),
    'primaryColorDark': Color(0xff002171),
    'primaryColorLight': Color(0xff5472d3),
    'onPrimary': Color(0xffffffff),
  },
  {
    'primaryColor': Color(0xff311b92),
    'primaryColorDark': Color(0xff000063),
    'primaryColorLight': Color(0xff6746c3),
    'onPrimary': Color(0xffffffff),
  },
];

final kDarkTheme = ThemeData.dark();

final kThemeList =
    kThemeColorMap.map((colorMap) => themeMaker(colorMap)).toList();

ThemeData themeMaker(Map<String, Color> colorMap) {
  return ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
    ),
    primaryColor: colorMap['primaryColor'],
    primaryColorDark: colorMap['primaryColorDark'],
    primaryColorLight: colorMap['primaryColorLight'],
    accentColor: colorMap['primaryColor'],
    dividerColor: ThemeData.light().textTheme.caption!.color,
    colorScheme: ColorScheme.light().copyWith(
      primary: colorMap['primaryColor'],
      primaryVariant: colorMap['primaryColorDark'],
      onPrimary: colorMap['onPrimary'],
      secondary: colorMap['primaryColor'],
      secondaryVariant: colorMap['primaryColorDark'],
      onSecondary: colorMap['onPrimary'],
    ),
  );
}
