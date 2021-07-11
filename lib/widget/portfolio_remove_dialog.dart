import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';

class PortfolioRemoveDialog extends StatelessWidget {
  final PortfolioModel portfolioModel;
  final Function() onRemove;
  PortfolioRemoveDialog({
    required this.portfolioModel,
    required this.onRemove,
  });

  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,###0.0#", "en_US");
  final DateFormat dateFormat = DateFormat.yMMMMd('en_US').add_jm();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      title: Text(
        'Remove from portfolio?',
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
      ),
      content: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Symbol',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
            ),
            TextSpan(
              text: '\n' +
                  (portfolioModel.symbolModel == null
                      ? 'Error'
                      : portfolioModel.symbolModel!.symbol),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '\n\nQuantity',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
            ),
            TextSpan(
              text: '\n' + (portfolioModel.quantity.toString()),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '\n\nPurchase Price',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
            ),
            TextSpan(
              text: '\n' + numberFormat.format(portfolioModel.purchasePrice),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '\n\nPurchase Date',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
            ),
            TextSpan(
              text: '\n' + dateFormat.format(portfolioModel.purchaseDate),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.check,
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
          onPressed: onRemove,
        ),
        IconButton(
          icon: Icon(Icons.close,
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(200)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
