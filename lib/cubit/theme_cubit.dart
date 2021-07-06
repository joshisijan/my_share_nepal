import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_share_nepal/theme/theme.dart';
import 'package:my_share_nepal/theme/theme_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(kThemeList[0]) {
    checkTheme();
  }

  getThemeIndex() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('themeIndex') ?? 0;
  }

  checkTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isDarkTheme = sharedPreferences.getBool('isDark') ?? false;
    if (isDarkTheme)
      emit(kDarkTheme);
    else {
      int themeIndex = sharedPreferences.getInt('themeIndex') ?? 0;
      emit(kThemeList[themeIndex]);
    }
  }

  toggleDarkTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isDarkTheme = sharedPreferences.getBool('isDark') ?? false;
    if (!isDarkTheme) {
      emit(kDarkTheme);
      sharedPreferences.setBool('isDark', true);
    } else {
      int themeIndex = sharedPreferences.getInt('themeIndex') ?? 0;
      emit(kThemeList[themeIndex]);
      sharedPreferences.setBool('isDark', false);
    }
  }

  changeTheme(int themeIndex) async {
    emit(kThemeList[themeIndex]);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('themeIndex', themeIndex);
  }
}
