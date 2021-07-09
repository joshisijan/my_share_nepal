import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/symbol_tab.dart';

class PortfolioOverallTab extends StatelessWidget {
  final List<PortfolioModel> portfolios;

  PortfolioOverallTab({
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
              Icons.arrow_downward,
              size: Theme.of(context).textTheme.headline4!.fontSize,
              color: Colors.red,
            ),
            Text(
              '10.80%',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.red,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          'Rs. 22,65,111.22',
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
          'Rs. 65,111.22',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          'profit',
          style: Theme.of(context).textTheme.overline!.copyWith(
                color: Colors.green,
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
              MaterialButton(
                color: Theme.of(context).primaryColorLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
                child: Icon(
                  Icons.summarize,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: kDefaultPadding / 2,
              ),
              MaterialButton(
                color: Theme.of(context).primaryColorLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
                child: Icon(
                  Icons.insights,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Column(
          children: portfolios.map<Widget>((portfolio) {
            return SymbolTab(
              symbolModel: portfolio.symbolModel,
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
