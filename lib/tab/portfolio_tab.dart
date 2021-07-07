import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';

class PortfolioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Theme.of(context).primaryColorDark,
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            ),
            child: Column(
              children: [
                Text(
                  'PORTFOLIO VALUE',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(200),
                      ),
                ),
                SizedBox(
                  height: kDefaultPadding / 4,
                ),
                Text(
                  'Rs. 200,000,000',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Column(
                  children: [
                    Text(
                      'OVERALL PROFIT/LOSS',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(200),
                          ),
                    ),
                    SizedBox(
                      height: kDefaultPadding / 4,
                    ),
                    Text(
                      'Rs. 200,000,000',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
