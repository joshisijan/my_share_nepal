import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class BigLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: kDefaultPadding * 4,
          ),
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            'Loading...',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
