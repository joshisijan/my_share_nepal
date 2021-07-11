import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class CustomButton extends StatelessWidget {
  final bool isIconButton;
  final IconData? icon;
  final String? text;
  final Function() onPressed;
  CustomButton({
    this.isIconButton = false,
    this.icon,
    this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).buttonColor
          : Theme.of(context).primaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: !isIconButton
          ? Text(
              text ?? '',
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).colorScheme.onPrimary.withAlpha(200)
                    : Theme.of(context).primaryColorDark,
              ),
            )
          : Icon(
              icon,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).colorScheme.onPrimary.withAlpha(200)
                  : Theme.of(context).primaryColorDark,
            ),
      onPressed: onPressed,
    );
  }
}
