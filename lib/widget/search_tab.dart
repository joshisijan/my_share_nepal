import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(kDefaultPadding),
      children: [
        Text(
          'Search',
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
