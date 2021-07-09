import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/cubit/portfolio_state.dart';
import 'package:my_share_nepal/cubit/portfolio_tab_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/tab/portfolio_overall_tab.dart';
import 'package:my_share_nepal/tab/portfolio_today_tab.dart';
import 'package:my_share_nepal/widget/no_portfolio.dart';

class PortfolioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _tabIndex = context.watch<PortfolioTabCubit>().state;
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
            length: 2,
            child: Column(
              children: [
                TabBar(
                  indicator: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  ),
                  onTap: (index) {
                    context.read<PortfolioTabCubit>().changeTab(index);
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
                return SizedBox.shrink();
              } else if (portfolioState is PortfolioError) {
                return BigError();
              } else if (portfolioState is PortfolioEmpty) {
                return NoPortfolio();
              } else {
                return _tabIndex == 0
                    ? PortfolioTodayTab(
                        portfolios:
                            (portfolioState as PortfolioLoaded).portfolios,
                      )
                    : PortfolioOverallTab(
                        portfolios:
                            (portfolioState as PortfolioLoaded).portfolios,
                      );
              }
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
