import 'package:flutter/material.dart';

double stringToDouble(String x) {
  return double.parse(x.replaceAll(RegExp('[,]'), ''));
}

SnackBar normalSnackBar(BuildContext context, String content,
    {bool error = false}) {
  return SnackBar(
    backgroundColor: error
        ? Theme.of(context).errorColor
        : Theme.of(context).primaryColorLight,
    content: Text(
      content,
      style: TextStyle(
        color: error
            ? null
            : Theme.of(context).colorScheme.onPrimary.withAlpha(150),
      ),
    ),
  );
}
