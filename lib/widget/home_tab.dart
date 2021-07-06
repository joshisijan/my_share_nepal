import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            'Home',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
