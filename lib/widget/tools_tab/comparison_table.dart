import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

class ComparisonTable extends StatelessWidget {
  final SymbolModel symbolModelOne;
  final SymbolModel? symbolModelTwo;
  ComparisonTable({
    required this.symbolModelOne,
    this.symbolModelTwo,
  });

  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Table(
          border: TableBorder.all(
            color: Theme.of(context).primaryColor.withAlpha(50),
          ),
          children: [
            customTableRow(
              context,
              'Symbol',
              symbolModelOne.symbol,
              symbolModelTwo == null ? 'Not Added' : symbolModelTwo!.symbol,
            ),
            customTableRow(
              context,
              'Open',
              numberFormat.format(symbolModelOne.open),
              symbolModelTwo == null
                  ? 'Not Added'
                  : numberFormat.format(symbolModelTwo!.open),
            ),
            customTableRow(
                context,
                'High',
                numberFormat.format(symbolModelOne.high),
                symbolModelTwo == null
                    ? 'Not Added'
                    : numberFormat.format(
                        symbolModelTwo!.high,
                      )),
            customTableRow(
              context,
              'Low',
              numberFormat.format(symbolModelOne.low),
              symbolModelTwo == null
                  ? 'Not Added'
                  : numberFormat.format(symbolModelTwo!.low),
            ),
            customTableRow(
              context,
              'LTP',
              numberFormat.format(symbolModelOne.close),
              symbolModelTwo == null
                  ? 'Not Added'
                  : numberFormat.format(symbolModelTwo!.close),
            ),
          ],
        ),
      ],
    );
  }

  TableRow customTableRow(
    BuildContext context,
    String title,
    dynamic first,
    dynamic second,
  ) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColorLight.withAlpha(50),
            padding: EdgeInsets.symmetric(
              horizontal: kHalfPadding,
              vertical: kDefaultPadding,
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor.withAlpha(50),
            padding: EdgeInsets.symmetric(
              horizontal: kHalfPadding,
              vertical: kDefaultPadding,
            ),
            child: Text(
              first,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        TableCell(
          child: Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColorDark.withAlpha(50),
            padding: EdgeInsets.symmetric(
              horizontal: kHalfPadding,
              vertical: kDefaultPadding,
            ),
            child: Text(
              second,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ],
    );
  }
}
