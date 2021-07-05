import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/theme_cubit.dart';

class SettingTab extends StatefulWidget {
  @override
  _SettingTabState createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    bool isSystemTheme = context.watch<ThemeCubit>().state == 2;
    bool isDarkTheme = context.watch<ThemeCubit>().state == 1;
    return Container(
      child: ListView(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
            title: Text('System Theme'),
            trailing: Switch(
              value: isSystemTheme,
              onChanged: (value) {
                if (isSystemTheme) {
                  context.read<ThemeCubit>().changeTheme(0);
                } else {
                  context.read<ThemeCubit>().changeTheme(2);
                }
              },
            ),
          ),
          AbsorbPointer(
            absorbing: isSystemTheme,
            child: Opacity(
              opacity: isSystemTheme ? 0.5 : 1.0,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
                title: Text('Dark Mode'),
                trailing: Switch(
                  value: isDarkTheme,
                  onChanged: (value) {
                    if (isDarkTheme) {
                      context.read<ThemeCubit>().changeTheme(0);
                    } else {
                      context.read<ThemeCubit>().changeTheme(1);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
