import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final Widget trailing;
  final IconData icon;
  final bool disabled;
  SettingListTile({
    required this.title,
    required this.icon,
    required this.trailing,
    this.disabled = false,
  });
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: Opacity(
        opacity: disabled ? 0.5 : 1.0,
        child: ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
