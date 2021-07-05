import 'package:flutter/material.dart';
import 'package:my_share_nepal/app.dart';
import 'package:my_share_nepal/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/theme/theme.dart';

void main() {
  runApp(AppBase());
}

class AppBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: AppBaseInternal(),
    );
  }
}

class AppBaseInternal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, int>(
      builder: (context, themeIndex) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeIndex == 2
              ? kLightTheme
              : themeIndex == 0
                  ? kLightTheme
                  : kDarkTheme,
          darkTheme: themeIndex == 2 ? kDarkTheme : null,
          home: App(),
        );
      },
    );
  }
}
