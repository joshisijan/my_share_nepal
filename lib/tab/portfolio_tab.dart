import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';
import 'package:my_share_nepal/tab/portfolio_overall_tab.dart';
import 'package:my_share_nepal/tab/portfolio_today_tab.dart';

class PortfolioTab extends StatefulWidget {
  @override
  _PortfolioTabState createState() => _PortfolioTabState();
}

class _PortfolioTabState extends State<PortfolioTab> {
  int tabIndex = 0;
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
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  indicator: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  ),
                  onTap: (index) {
                    if (index == 0) {
                      tabIndex = 0;
                    } else {
                      tabIndex = 1;
                    }
                    setState(() {});
                  },
                  tabs: [
                    Tab(
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.today,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(200),
                        ),
                        label: Text(
                          'Today',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(200)),
                        ),
                        onPressed: null,
                      ),
                    ),
                    Tab(
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.bar_chart,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(200),
                        ),
                        label: Text(
                          'Overall',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(200)),
                        ),
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
                tabIndex == 0 ? PortfolioTodayTab() : PortfolioOverallTab(),
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
