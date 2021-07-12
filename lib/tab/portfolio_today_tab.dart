import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/widget/portfolio_tab/portfolio_symbol_tile.dart';

class PortfolioTodayTab extends StatelessWidget {
  final List<PortfolioModel> portfolioModels;
  PortfolioTodayTab({
    required this.portfolioModels,
  });
  @override
  Widget build(BuildContext context) {
    double changePercentage = 0.0;
    for (int i = 0; i < portfolioModels.length; i++) {
      if (portfolioModels[i].symbolModel != null) {
        changePercentage +=
            portfolioModels[i].symbolModel!.differencePercentage;
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
          verticalDirection:
              VerticalDirection.up, // to show latest added share on top
          children: List.generate(portfolioModels.length, (index) {
            // for showing portfolio of same same name together
            // all share except first
            if (index > 0 && index < portfolioModels.length) {
              // checking if symbol is same
              if (portfolioModels[index].symbolModel!.symbol ==
                  portfolioModels[index - 1].symbolModel!.symbol) {
                return SizedBox.shrink();
              }
            }
            return PortfolioSymbolTile(
              portfolioModel: portfolioModels[index],
              id: portfolioModels[index].id,
            );
          }),
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
