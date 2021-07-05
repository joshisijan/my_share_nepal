import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<int> {
  ThemeCubit() : super(0) {
    checkTheme();
  }

  checkTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int themeIndex = sharedPreferences.getInt('themeIndex') ?? 0;
    emit(themeIndex);
  }

  changeTheme(int themeIndex) async {
    emit(themeIndex);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('themeIndex', themeIndex);
  }
}
