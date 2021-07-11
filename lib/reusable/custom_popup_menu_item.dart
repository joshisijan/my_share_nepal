import 'package:flutter/material.dart';

class CustomPopupMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  CustomPopupMenuItem({
    required this.icon,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
        ),
      ),
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
      ),
      onPressed: null,
    );
  }
}
