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
                ? Colors.red
                : Theme.of(context).colorScheme.onPrimary.withAlpha(150),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            this.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: isError
                      ? Colors.red
                      : Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            this.text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.overline!.copyWith(
                  color: isError
                      ? Colors.red
                      : Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
