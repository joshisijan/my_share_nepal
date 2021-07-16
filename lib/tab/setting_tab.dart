import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/theme_cubit.dart';
import 'package:my_share_nepal/reusable/setting_list_tile.dart';
import 'package:my_share_nepal/widget/settings_tab/app_color_list.dart';

class SettingTab extends StatefulWidget {
  @override
  _SettingTabState createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme =
        context.watch<ThemeCubit>().state.brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            'Settings',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            'Apperance',
            style: Theme.of(context).textTheme.headline6,
          ),
          Divider(),
          SettingListTile(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            onTap: () {
              context.read<ThemeCubit>().toggleDarkTheme();
            },
            trailing: Switch(
              value: isDarkTheme,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleDarkTheme();
              },
            ),
          ),
          SettingListTile(
            icon: Icons.palette,
            title: 'App Color',
            trailing: MaterialButton(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
              ),
              onPressed: null,
            ),
          ),
          AppColorList(),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            'Informations',
            style: Theme.of(context).textTheme.headline6,
          ),
          Divider(),
          SettingListTile(
            icon: Icons.info,
            title: 'About Us',
            onTap: () {},
          ),
          SettingListTile(
            icon: Icons.groups,
            title: 'Contributors',
            onTap: () {},
          ),
          SettingListTile(
            icon: Icons.source,
            title: 'Data Source',
            onTap: () {},
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
        ],
      ),
    );
  }
}
