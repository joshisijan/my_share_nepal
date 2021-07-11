import 'package:flutter/material.dart';

class SmallBottomNotification extends StatelessWidget {
  final String title;
  SmallBottomNotification({
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).buttonColor
          : Theme.of(context).primaryColorLight,
      padding: EdgeInsets.all(2.0),
      child: Text(
        this.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
            ),
      ),
    );
  }
}
