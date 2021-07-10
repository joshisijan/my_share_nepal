import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/symbol_tab.dart';

class PortfolioTodayTab extends StatelessWidget {
  final List<PortfolioModel> portfolios;

  PortfolioTodayTab({
    required this.portfolios,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kDefaultPadding * 2,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.arrow_upward,
              size: Theme.of(context).textTheme.headline4!.fontSize,
              color: Colors.green,
            ),
            Text(
              '2.80%',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.green,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding * 2,
        ),
        Column(
          children: portfolios.map<Widget>((portfolio) {
            return SymbolTab(
              symbolModel: portfolio.symbolModel,
              id: portfolio.id,
            );
          }).toList(),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          height: kDefaultPadding * 2,
        ),
      ],
    );
  }
}
