import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class BigLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            height: kDefaultPadding * 4,
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            'Loading...',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
