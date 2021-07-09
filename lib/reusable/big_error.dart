import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class BigError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: kDefaultPadding * 4,
          ),
          Icon(
            Icons.error,
            size: kExtraLargeIconSize,
            color: Colors.red,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            'An Error Occurred!',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Try again later!',
            style: Theme.of(context).textTheme.overline!.copyWith(
                  color: Colors.red,
                ),
          ),
        ],
      ),
    );
  }
}
