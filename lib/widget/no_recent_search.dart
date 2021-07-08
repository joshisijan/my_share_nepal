import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';

class NoRecentSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: kDefaultPadding * 4,
          ),
          Icon(
            Icons.close,
            size: kExtraLargeIconSize,
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            'No recent search',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Try searching for something first.',
            style: Theme.of(context).textTheme.overline!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
