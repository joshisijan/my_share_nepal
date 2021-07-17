import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/helper/constants.dart';

class SummaryPortfolioDialog extends StatelessWidget {
  final double investment;
  final double value;
  final int totalShare;
  final double difference;
  SummaryPortfolioDialog({
    required this.investment,
    required this.value,
    required this.totalShare,
    required this.difference,
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
      title: Text('Portfolio Summary'),
      content: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Total Today\'s Value',
              style: Theme.of(context).textTheme.caption,
            ),
            TextSpan(
              text: '\n' + numberFormat.format(value),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(
              text: '\n\nTotal Investment',
              style: Theme.of(context).textTheme.caption,
            ),
            TextSpan(
              text: '\n' + numberFormat.format(investment),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(
              text: '\n\nTotal Number of Share',
              style: Theme.of(context).textTheme.caption,
            ),
            TextSpan(
              text: '\n' + numberFormat.format(totalShare),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(
              text: difference == 0
                  ? '\n\nNeither Profit Nor Loss'
                  : difference < 0
                      ? '\n\nTotal Loss'
                      : '\n\nTotal Profit',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: difference == 0
                        ? null
                        : difference < 0
                            ? Colors.red
                            : Colors.green,
                  ),
            ),
            TextSpan(
              text: '\n' + numberFormat.format(difference),
              style: TextStyle(
                color: difference == 0
                    ? null
                    : difference < 0
                        ? Colors.red
                        : Colors.green,
                fontWeight: FontWeight.bold,
              ),
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
