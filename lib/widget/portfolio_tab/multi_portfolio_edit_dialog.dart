import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/cubit/portfolio_multi_symbols_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiPortfolioEditDialog extends StatelessWidget {
  final int symbolId;
  MultiPortfolioEditDialog({
    required this.symbolId,
  });
  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,###0.0#", "en_US");
  final DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  @override
  Widget build(BuildContext context) {
    context.read<PortfolioMultiSymbolsCubit>().getForMultiSymbols(symbolId);
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Which one to edit?',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color:
                        Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                  ),
            ),
            TextSpan(
              text: '\nScroll if options hidden.\nPress edit button to edit.',
              style: Theme.of(context).textTheme.overline!.copyWith(
                    color:
                        Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                  ),
            )
          ],
        ),
      ),
      content:
          BlocBuilder<PortfolioMultiSymbolsCubit, PortfolioMultiSymbolsState>(
        builder: (context, portfolioMultiSymbolsState) {
          if (portfolioMultiSymbolsState is PortfolioMultiSymbolsLoading) {
            return Container(
              height: MediaQuery.of(context).size.width * 0.8,
              width: double.maxFinite,
              child: ListView(
                children: [
                  BigLoading(),
                ],
              ),
            );
          } else if (portfolioMultiSymbolsState is PortfolioMultiSymbolsError) {
            return Container(
              height: MediaQuery.of(context).size.width * 0.8,
              width: double.maxFinite,
              child: ListView(
                children: [
                  BigError(),
                ],
              ),
            );
          } else {
            portfolioMultiSymbolsState as PortfolioMultiSymbolsLoaded;
            List<PortfolioModel> portfolioModels =
                portfolioMultiSymbolsState.portfolioModels;

            return Container(
              height: MediaQuery.of(context).size.width * 0.8,
              width: double.maxFinite,
              child: ListView(
                children: [
                  Column(
                    verticalDirection: VerticalDirection.up,
                    children: portfolioModels.map<Widget>((portfolioModel) {
                      return Container(
                        margin: EdgeInsets.only(bottom: kDefaultPadding),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .primaryColorLight
                              .withAlpha(150),
                          borderRadius:
                              BorderRadius.circular(kDefaultBorderRadius),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(kDefaultPadding),
                          dense: true,
                          isThreeLine: true,
                          title: Text(
                            portfolioModel.symbolModel!.symbol,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary
                                          .withAlpha(150),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Number of share:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                            .withAlpha(150),
                                      ),
                                ),
                                TextSpan(
                                  text:
                                      '\n' + portfolioModel.quantity.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withAlpha(150),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nPurchase Price:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                            .withAlpha(150),
                                      ),
                                ),
                                TextSpan(
                                  text: '\n' +
                                      portfolioModel.purchasePrice.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withAlpha(150),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nPurchase Date: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                            .withAlpha(150),
                                      ),
                                ),
                                TextSpan(
                                  text: '\n' +
                                      dateFormat
                                          .format(portfolioModel.purchaseDate),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withAlpha(150),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          leading: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(150),
                            ),
                            onPressed: () {
                              // Navigate to edit page
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close,
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(150)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
