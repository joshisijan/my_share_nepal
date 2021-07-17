import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/portfolio/portfolio_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:my_share_nepal/tab/portfolio_overall_tab.dart';
import 'package:my_share_nepal/tab/portfolio_today_tab.dart';
import 'package:my_share_nepal/widget/portfolio_tab/no_portfolio.dart';

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
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Wrap(
            children: [
              MaterialButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    color: _tabIndex == 0
                        ? Theme.of(context).primaryColorLight.withAlpha(50)
                        : null,
                  ),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.today,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorLight,
                    ),
                    label: Text(
                      'Today',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorLight,
                      ),
                    ),
                    onPressed: null,
                  ),
                ),
                onPressed: () {
                  if (_tabIndex != 0) {
                    setState(() {
                      _tabIndex = 0;
                    });
                  }
                },
              ),
              MaterialButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    color: _tabIndex == 1
                        ? Theme.of(context).primaryColorLight.withAlpha(50)
                        : null,
                  ),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.bar_chart,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorLight,
                    ),
                    label: Text(
                      'Overall',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorLight,
                      ),
                    ),
                    onPressed: null,
                  ),
                ),
                onPressed: () {
                  if (_tabIndex != 1) {
                    setState(() {
                      _tabIndex = 1;
                    });
                  }
                },
              ),
            ],
          ),
          // main body starts from here
          BlocBuilder<PortfolioCubit, PortfolioState>(
            builder: (context, portfolioState) {
              if (portfolioState is PortfolioLoading) {
                return BigLoading();
              } else if (portfolioState is PortfolioError) {
                return BigError();
              } else {
                portfolioState as PortfolioLoaded;
                if (portfolioState.portfolioModels.isEmpty) {
                  return NoPortfolio();
                }
                return AnimatedSwitcher(
                  duration: kDefaultDuration,
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: _tabIndex == 0
                      ? PortfolioTodayTab(
                          portfolioModels: portfolioState.portfolioModels,
                        )
                      : PortfolioOverallTab(
                          portfolioModels: portfolioState.portfolioModels,
                        ),
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
