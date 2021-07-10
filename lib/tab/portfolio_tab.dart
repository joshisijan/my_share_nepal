import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/cubit/portfolio_state.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:my_share_nepal/tab/portfolio_overall_tab.dart';
import 'package:my_share_nepal/tab/portfolio_today_tab.dart';
import 'package:my_share_nepal/widget/no_portfolio.dart';

class PortfolioTab extends StatefulWidget {
  @override
  _PortfolioTabState createState() => _PortfolioTabState();
}

class _PortfolioTabState extends State<PortfolioTab> {
  int _tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    context.read<PortfolioCubit>().getPortfolio();
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
            initialIndex: 0,
            length: 2,
            child: Column(
              children: [
                TabBar(
                  controller: DefaultTabController.of(context),
                  indicator: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  ),
                  onTap: (index) {
                    if (index != _tabIndex) {
                      setState(() {
                        _tabIndex = index;
                      });
                    }
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
              ],
            ),
          ),
          // main body starts from here
          BlocBuilder<PortfolioCubit, PortfolioState>(
            builder: (context, portfolioState) {
              if (portfolioState is PortfolioLoading) {
                return BigLoading();
              } else if (portfolioState is PortfolioError) {
                return BigError();
              } else {
                if ((portfolioState as PortfolioLoaded).portfolios.isEmpty) {
                  return NoPortfolio();
                }
                return _tabIndex == 0
                    ? PortfolioTodayTab(
                        portfolios: portfolioState.portfolios,
                      )
                    : PortfolioOverallTab(
                        portfolios: portfolioState.portfolios,
                      );
              }
            },
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
        ],
      ),
    );
  }
}
