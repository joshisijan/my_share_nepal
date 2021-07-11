import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/widget/portfolio_remove_dialog.dart';

class PortfolioSymbolTile extends StatelessWidget {
  final PortfolioModel portfolioModel;
  final int? id;
  PortfolioSymbolTile({
    required this.portfolioModel,
    required this.id,
  });
  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,###0.0#", "en_US");
  @override
  Widget build(BuildContext context) {
    SymbolModel? symbolModel = portfolioModel.symbolModel;
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PortfolioRemoveDialog(
                        portfolioModel: portfolioModel,
                        onRemove: () {
                          context.read<PortfolioCubit>().removeSymbol(id ?? 0);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
              Text(
                symbolModel == null ? 'Error' : symbolModel.symbol,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(200),
                      fontWeight: FontWeight.bold,
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
                      symbolModel == null
                          ? 'Error'
                          : numberFormat.format(symbolModel.close),
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(200),
                            fontWeight: FontWeight.bold,
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
                            symbolModel == null
                                ? Icons.arrow_upward
                                : symbolModel.differencePercentage < 0
                                    ? Icons.arrow_downward
                                    : symbolModel.differencePercentage == 0
                                        ? Icons.lunch_dining
                                        : Icons.arrow_upward,
                            size:
                                Theme.of(context).textTheme.bodyText2!.fontSize,
                            color: symbolModel == null
                                ? Colors.green
                                : symbolModel.differencePercentage < 0
                                    ? Colors.red
                                    : symbolModel.differencePercentage == 0
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                            .withAlpha(200)
                                        : Colors.green,
                          ),
                          Text(
                            symbolModel == null
                                ? 'Error'
                                : symbolModel.differencePercentage < 0
                                    ? (symbolModel.differencePercentage * -1)
                                            .toStringAsFixed(2) +
                                        '%'
                                    : symbolModel.differencePercentage
                                            .toStringAsFixed(2) +
                                        '%',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: symbolModel == null
                                      ? Colors.green
                                      : symbolModel.differencePercentage < 0
                                          ? Colors.red
                                          : symbolModel.differencePercentage ==
                                                  0
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary
                                                  .withAlpha(200)
                                              : Colors.green,
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
