import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/theme_cubit.dart';
import 'package:my_share_nepal/reusable/setting_list_tile.dart';

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
      color: Theme.of(context).primaryColorDark,
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            'Settings',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2,
                    horizontal: kDefaultPadding,
                  ),
                  child: Text(
                    'Apperance',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(200),
                        ),
                  ),
                ),
                Divider(
                  color: Theme.of(context).primaryColorDark,
                ),
                SettingListTile(
                  icon: Icons.format_paint,
                  title: 'System Theme',
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
                SettingListTile(
                  disabled: isSystemTheme,
                  icon: Icons.dark_mode,
                  title: 'Dark Mode',
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
              ],
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2,
                    horizontal: kDefaultPadding,
                  ),
                  child: Text(
                    'Information',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(200),
                        ),
                  ),
                ),
                Divider(
                  color: Theme.of(context).primaryColorDark,
                ),
                SettingListTile(
                  icon: Icons.info,
                  title: 'About Us',
                  trailing: MaterialButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(200),
                    ),
                    onPressed: () {},
                  ),
                ),
                SettingListTile(
                  icon: Icons.groups,
                  title: 'Contributors',
                  trailing: MaterialButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(200),
                    ),
                    onPressed: () {},
                  ),
                ),
                SettingListTile(
                  icon: Icons.source,
                  title: 'Data Source',
                  trailing: MaterialButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(200),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
