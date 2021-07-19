import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onPressed;
  final bool isError;

  const IconTextButton({
    required this.icon,
    required this.label,
    this.onPressed,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isError
              ? Theme.of(context).errorColor
              : Theme.of(context).primaryColorLight.withAlpha(50),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: kHalfPadding,
          ),
        ),
      ),
      icon: Icon(
        icon,
        color: isError ? Theme.of(context).colorScheme.onPrimary : null,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: isError ? Theme.of(context).colorScheme.onPrimary : null,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
