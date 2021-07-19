import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/widget/tools_tab/comparison_detail_tile.dart';

class ComparisonDetail extends StatelessWidget {
  final SymbolModel symbolModelOne;
  final SymbolModel symbolModelTwo;
  ComparisonDetail({
    required this.symbolModelOne,
    required this.symbolModelTwo,
  });

  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ComparisonDetailTile(
          title: 'Symbol',
          firstLabel: symbolModelOne.symbol,
          secondLabel: symbolModelTwo.symbol,
        ),
        ComparisonDetailTile(
          title: 'Open',
          firstLabel: numberFormat.format(symbolModelOne.open),
          secondLabel: numberFormat.format(symbolModelTwo.open),
          isMoney: true,
        ),
        ComparisonDetailTile(
          title: 'High',
          firstLabel: numberFormat.format(symbolModelOne.high),
          secondLabel: numberFormat.format(symbolModelTwo.high),
          isMoney: true,
        ),
        ComparisonDetailTile(
          title: 'Low',
          firstLabel: numberFormat.format(symbolModelOne.low),
          secondLabel: numberFormat.format(symbolModelTwo.low),
          isMoney: true,
        ),
        ComparisonDetailTile(
          title: 'Close',
          firstLabel: numberFormat.format(symbolModelOne.close),
          secondLabel: numberFormat.format(symbolModelTwo.close),
          isMoney: true,
        ),
        ComparisonDetailTile(
          title: 'Previous Close',
          firstLabel: numberFormat.format(symbolModelOne.previousClose),
          secondLabel: numberFormat.format(symbolModelTwo.previousClose),
          isMoney: true,
        ),
        ComparisonDetailTile(
          title: 'Difference',
          firstLabel: numberFormat.format(symbolModelOne.difference),
          secondLabel: numberFormat.format(symbolModelTwo.difference),
          isMoney: true,
          firstLabelColor: symbolModelOne.differencePercentage > 0
              ? Colors.green
              : symbolModelOne.differencePercentage == 0
                  ? null
                  : Theme.of(context).errorColor,
          secondLabelColor: symbolModelTwo.differencePercentage > 0
              ? Colors.green
              : symbolModelTwo.differencePercentage == 0
                  ? null
                  : Theme.of(context).errorColor,
        ),
        ComparisonDetailTile(
          title: 'Difference Percentage',
          firstLabel:
              numberFormat.format(symbolModelOne.differencePercentage) + '%',
          secondLabel:
              numberFormat.format(symbolModelTwo.differencePercentage) + '%',
          firstLabelColor: symbolModelOne.difference > 0
              ? Colors.green
              : symbolModelOne.difference == 0
                  ? null
                  : Theme.of(context).errorColor,
          secondLabelColor: symbolModelTwo.difference > 0
              ? Colors.green
              : symbolModelTwo.difference == 0
                  ? null
                  : Theme.of(context).errorColor,
        ),
        ComparisonDetailTile(
          title: 'Volume',
          firstLabel: numberFormat.format(symbolModelOne.volume),
          secondLabel: numberFormat.format(symbolModelTwo.volume),
        ),
        ComparisonDetailTile(
          title: 'Turnover',
          firstLabel: numberFormat.format(symbolModelOne.turnover),
          secondLabel: numberFormat.format(symbolModelTwo.turnover),
          isMoney: true,
        ),
        ComparisonDetailTile(
          title: 'Transactions',
          firstLabel: numberFormat.format(symbolModelOne.transactions),
          secondLabel: numberFormat.format(symbolModelTwo.transactions),
        ),
        ComparisonDetailTile(
          title: '52 Weeks High',
          firstLabel: numberFormat.format(symbolModelOne.fiftyTwoWeeksHigh),
          secondLabel: numberFormat.format(symbolModelTwo.fiftyTwoWeeksHigh),
          isMoney: true,
        ),
        ComparisonDetailTile(
          title: '52 Weeks Low',
          firstLabel: numberFormat.format(symbolModelOne.fiftyTwoWeeksLow),
          secondLabel: numberFormat.format(symbolModelTwo.fiftyTwoWeeksLow),
          isMoney: true,
        ),
      ],
    );
  }
}
