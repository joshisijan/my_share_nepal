import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/portfolio_symbol_tile.dart';

class PortfolioTodayTab extends StatelessWidget {
  final List<PortfolioModel> portfolios;
  PortfolioTodayTab({
    required this.portfolios,
  });
  @override
  Widget build(BuildContext context) {
    double changePercentage = 0.0;
    for (int i = 0; i < portfolios.length; i++) {
      if (portfolios[i].symbolModel != null) {
        changePercentage += portfolios[i].symbolModel!.differencePercentage;
      }
    }
    return Column(
      children: [
        SizedBox(
          height: kDefaultPadding * 2,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              changePercentage < 0
                  ? Icons.arrow_downward
                  : changePercentage == 0
                      ? Icons.lunch_dining
                      : Icons.arrow_upward,
              size: Theme.of(context).textTheme.headline4!.fontSize,
              color: changePercentage < 0
                  ? Colors.red
                  : changePercentage == 0
                      ? Theme.of(context).colorScheme.onPrimary.withAlpha(150)
                      : Colors.green,
            ),
            Text(
              changePercentage < 0
                  ? (changePercentage * -1).toStringAsFixed(2) + '%'
                  : changePercentage.toStringAsFixed(2) + '%',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: changePercentage < 0
                        ? Colors.red
                        : changePercentage == 0
                            ? Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(150)
                            : Colors.green,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding * 2,
        ),
        Column(
          verticalDirection: VerticalDirection.up,
          children: portfolios.map<Widget>((portfolio) {
            return PortfolioSymbolTile(
              portfolioModel: portfolio,
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
