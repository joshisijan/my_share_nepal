import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class ComparisonDetailTile extends StatelessWidget {
  final String title;
  final String firstLabel;
  final String secondLabel;
  final Color? firstLabelColor;
  final Color? secondLabelColor;
  final bool isMoney;

  const ComparisonDetailTile({
    required this.title,
    required this.firstLabel,
    required this.secondLabel,
    this.firstLabelColor,
    this.secondLabelColor,
    this.isMoney = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(kDefaultPadding),
      margin: EdgeInsets.symmetric(vertical: kHalfPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withAlpha(50),
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                width: MediaQuery.of(context).size.width / 2 - 40,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Theme.of(context).primaryColorLight.withAlpha(100),
                    ),
                  ),
                ),
                child: Text(
                  (isMoney ? 'Rs. ' : '') + firstLabel,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: firstLabelColor,
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: kHalfPadding,
                  top: kDefaultPadding,
                  bottom: kDefaultPadding,
                ),
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Text(
                  (isMoney ? 'Rs. ' : '') + secondLabel,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: secondLabelColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
