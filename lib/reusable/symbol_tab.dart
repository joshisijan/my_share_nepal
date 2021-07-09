import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

class SymbolTab extends StatelessWidget {
  final SymbolModel? symbolModel;
  SymbolTab({
    required this.symbolModel,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.all(kDefaultPadding / 2),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: Theme.of(context).primaryColorLight,
                ),
                onPressed: () {},
              ),
              Text(
                symbolModel == null ? 'Error' : symbolModel!.symbol,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                child: Wrap(
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceAround,
                  children: [
                    Text(
                      '2,00,000.0',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(200),
                          ),
                    ),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kDefaultPadding / 3,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius),
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            size:
                                Theme.of(context).textTheme.bodyText2!.fontSize,
                            color: Colors.green,
                          ),
                          Text(
                            '1.80%',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.green,
                                    ),
                          ),
                        ],
                      ),
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
