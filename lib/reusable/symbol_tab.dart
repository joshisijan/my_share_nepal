import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';

class SymbolTab extends StatelessWidget {
  final String symbol;
  SymbolTab({
    required this.symbol,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          child: Row(
            children: [
              Text(
                symbol,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(200),
                    ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '200.0',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(200),
                          ),
                    ),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          size: Theme.of(context).textTheme.subtitle1!.fontSize,
                          color: Colors.green,
                        ),
                        Text(
                          '2.80%',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.green,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
