import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
            title: Text('System Theme'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          AbsorbPointer(
            absorbing: true,
            child: Opacity(
              opacity: 0.5,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
                title: Text('Dark Mode'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
