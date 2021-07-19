import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class ToolsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;
  final bool isError;
  ToolsCard({
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isError = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: kDefaultPadding),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 30.0,
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          decoration: BoxDecoration(
            color: isError
                ? Theme.of(context).errorColor.withAlpha(50)
                : Theme.of(context).primaryColorLight.withAlpha(50),
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 48.0,
                color: isError
                    ? Theme.of(context).errorColor
                    : Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
                  color: isError
                      ? Theme.of(context).errorColor
                      : Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
