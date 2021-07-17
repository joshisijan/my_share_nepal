import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class NothingFound extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final bool isError;
  final Function()? onReload;

  NothingFound({
    required this.icon,
    required this.title,
    required this.text,
    this.isError = false,
    this.onReload,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 2,
      ),
      child: Column(
        children: [
          SizedBox(
            height: kDefaultPadding * 4,
          ),
          Icon(
            this.icon,
            size: kExtraLargeIconSize,
            color: isError
                ? Theme.of(context).errorColor
                : Theme.of(context).textTheme.headline1!.color,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            this.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: isError
                      ? Theme.of(context).errorColor
                      : Theme.of(context).textTheme.headline1!.color,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            this.text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.overline!.copyWith(
                  color: isError
                      ? Theme.of(context).errorColor
                      : Theme.of(context).textTheme.headline1!.color,
                  fontWeight: FontWeight.bold,
                ),
          ),
          onReload != null
              ? SizedBox(height: kDefaultPadding)
              : SizedBox.shrink(),
          onReload != null
              ? TextButton.icon(
                  icon: Icon(
                    Icons.refresh,
                    color: Theme.of(context).errorColor,
                  ),
                  label: Text(
                    'Reload',
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                  onPressed: onReload,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
