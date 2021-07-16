import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/helper/utilities.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/portfolio_tab/portfolio_symbol_tile.dart';
import 'package:my_share_nepal/widget/portfolio_tab/summary_portfolio_dialog.dart';

class PortfolioOverallTab extends StatelessWidget {
  final List<PortfolioModel> portfolioModels;

  PortfolioOverallTab({
    required this.portfolioModels,
  });

  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");
  @override
  Widget build(BuildContext context) {
    double value = 0;
    double investment = 0;
    double change = 0;
    double changePercentage = 0;
    int totalShare = 0;
    for (int i = 0; i < portfolioModels.length; i++) {
      if (portfolioModels[i].symbolModel != null) {
        value +=
            portfolioModels[i].symbolModel!.close * portfolioModels[i].quantity;
        investment +=
            portfolioModels[i].quantity * portfolioModels[i].purchasePrice;
        totalShare += portfolioModels[i].quantity;
      }
    }
    change = value - investment;
    changePercentage = change / investment * 100;
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
                      ? Theme.of(context).colorScheme.onPrimary.withAlpha(200)
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
                                .withAlpha(200)
                            : Colors.green,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          'Rs. ' + numberFormat.format(value),
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          'Value',
          style: Theme.of(context).textTheme.overline!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
              ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          'Rs. ' + numberFormat.format(change),
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: change > 0
                    ? Colors.green
                    : change == 0
                        ? Theme.of(context).colorScheme.onPrimary.withAlpha(200)
                        : Colors.red,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          change > 0
              ? 'Profit'
              : change == 0
                  ? 'Neither profit nor loss'
                  : 'Loss',
          style: Theme.of(context).textTheme.overline!.copyWith(
                color: change > 0
                    ? Colors.green
                    : change == 0
                        ? Theme.of(context).colorScheme.onPrimary.withAlpha(150)
                        : Colors.red,
              ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          width: double.maxFinite,
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.summarize),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SummaryPortfolioDialog(
                      investment: investment,
                      value: value,
                      totalShare: totalShare,
                      difference: value - investment,
                    ),
                  );
                },
              ),
              SizedBox(
                width: kDefaultPadding / 2,
              ),
              IconButton(
                icon: Icon(Icons.insights),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(normalSnackBar(
                    context: context,
                    content: 'Share insight functionality comming soom!',
                  ));
                },
              ),
            ],
          ),
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
