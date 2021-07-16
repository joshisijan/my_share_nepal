import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final IconData icon;
  final Function()? onTap;
  SettingListTile({
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: kIconSpace,
          ),
          Text(
            title,
          ),
        ],
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
