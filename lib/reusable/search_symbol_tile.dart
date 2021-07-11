import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class SearchSymbolTile extends StatelessWidget {
  final String title;
  final Function() onAdd;
  SearchSymbolTile({
    required this.title,
    required this.onAdd,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).primaryColorLight,
          height: 0.0,
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2, vertical: kDefaultPadding / 2),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(200),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              MaterialButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
                color: Theme.of(context).primaryColorLight,
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                ),
                onPressed: onAdd,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
