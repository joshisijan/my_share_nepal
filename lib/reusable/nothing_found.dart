import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class NothingFound extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final bool isError;

  NothingFound({
    required this.icon,
    required this.title,
    required this.text,
    this.isError = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
