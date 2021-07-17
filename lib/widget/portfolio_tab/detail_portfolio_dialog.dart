import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';

class DetailPortfolioDialog extends StatelessWidget {
  final PortfolioModel portfolioModel;
  DetailPortfolioDialog({
    required this.portfolioModel,
  });

  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");
  final DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      title: Text('Detail'),
      content: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Symbol',
              style: Theme.of(context).textTheme.caption,
            ),
            TextSpan(
              text: '\n' +
                  (portfolioModel.symbolModel == null
                      ? 'Error'
                      : portfolioModel.symbolModel!.symbol),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(
              text: '\n\nNo. of share',
              style: Theme.of(context).textTheme.caption,
            ),
            TextSpan(
              text: '\n' + (portfolioModel.quantity.toString()),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(
              text: '\n\nPurchase Price',
              style: Theme.of(context).textTheme.caption,
            ),
            TextSpan(
              text: '\n' + numberFormat.format(portfolioModel.purchasePrice),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(
              text: '\n\nPurchase Date',
              style: Theme.of(context).textTheme.caption,
            ),
            TextSpan(
              text: '\n' + dateFormat.format(portfolioModel.purchaseDate),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
