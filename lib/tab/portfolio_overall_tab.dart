import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';

class PortfolioOverallTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          child: Text('world'),
        ),
      ],
    );
  }
}
