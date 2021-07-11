import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/custom_button_on_dark.dart';
import 'package:my_share_nepal/reusable/portfolio_symbol_tile.dart';

class PortfolioOverallTab extends StatelessWidget {
  final List<PortfolioModel> portfolios;

  PortfolioOverallTab({
    required this.portfolios,
  });

  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,###0.0#", "en_US");
  @override
  Widget build(BuildContext context) {
    double value = 0;
    double investment = 0;
    double change = 0;
    double changePercentage = 0;
    for (int i = 0; i < portfolios.length; i++) {
      if (portfolios[i].symbolModel != null) {
        value += portfolios[i].symbolModel!.close * portfolios[i].quantity;
        investment += portfolios[i].quantity * portfolios[i].purchasePrice;
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
                  ? 'hh'
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
              CustomButtonOnDark(
                isIconButton: true,
                icon: Icons.summarize,
                onPressed: () {},
              ),
              SizedBox(
                width: kDefaultPadding / 2,
              ),
              CustomButtonOnDark(
                isIconButton: true,
                icon: Icons.insights,
                onPressed: () {},
              ),
            ],
          ),
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
