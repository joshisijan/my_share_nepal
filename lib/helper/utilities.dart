import 'package:flutter/material.dart';

double stringToDouble(String x) {
  return double.parse(x.replaceAll(RegExp('[,]'), ''));
}

SnackBar normalSnackBar({
  required BuildContext context,
  IconData? icon,
  required String content,
  bool error = false,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  return SnackBar(
    backgroundColor: error
        ? Theme.of(context).errorColor
        : Theme.of(context).primaryColorLight,
    content: ListTile(
      dense: true,
      leading: Icon(
        icon ?? (error ? Icons.warning : Icons.info),
        color: error
            ? Theme.of(context).colorScheme.onPrimary.withAlpha(200)
            : Theme.of(context).colorScheme.onPrimary.withAlpha(150),
      ),
      title: Text(
        content,
        style: TextStyle(
          color: error
              ? Theme.of(context).colorScheme.onPrimary.withAlpha(200)
              : Theme.of(context).colorScheme.onPrimary.withAlpha(150),
        ),
      ),
    ),
  );
}
