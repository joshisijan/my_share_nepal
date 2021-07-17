import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/cubit/portfolio_multi_symbols_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/helper/utilities.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:my_share_nepal/reusable/nothing_found.dart';
import 'package:my_share_nepal/widget/portfolio_tab/remove_portfolio_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiPortfolioRemoveDialog extends StatelessWidget {
  final int symbolId;
  MultiPortfolioRemoveDialog({
    required this.symbolId,
  });
  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");
  final DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  @override
  Widget build(BuildContext context) {
    context.read<PortfolioMultiSymbolsCubit>().getForMultiSymbols(symbolId);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Which one to remove?',
              style: Theme.of(context).textTheme.headline6,
            ),
            TextSpan(
              text:
                  '\nScroll if options hidden.\nPress remove button to remove.',
              style: Theme.of(context).textTheme.overline,
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
            if (portfolioModels.length <= 0) {
              return Container(
                height: MediaQuery.of(context).size.width * 0.8,
                width: double.maxFinite,
                child: ListView(
                  children: [
                    NothingFound(
                      icon: Icons.close,
                      title: 'Everything  removed',
                      text: 'You can close this dialog.',
                    ),
                  ],
                ),
              );
            }
            if (portfolioModels.length <= 0) {
              return Container(
                height: MediaQuery.of(context).size.width * 0.8,
                width: double.maxFinite,
                child: ListView(
                  children: [
                    NothingFound(
                      icon: Icons.close,
                      title: 'Everything  removed',
                      text: 'You can close this dialog.',
                    ),
                  ],
                ),
              );
            }
            return Container(
              height: MediaQuery.of(context).size.width * 0.8,
              width: double.maxFinite,
              child: ListView(
                children: [
                  Column(
                    verticalDirection: VerticalDirection.up,
                    children: portfolioModels.map<Widget>((portfolioModel) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: kDefaultPadding),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kDefaultBorderRadius),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(kDefaultPadding),
                              dense: true,
                              isThreeLine: true,
                              title: Text(
                                portfolioModel.symbolModel!.symbol,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Number of share:',
                                      style:
                                          Theme.of(context).textTheme.overline,
                                    ),
                                    TextSpan(
                                      text: '\n' +
                                          portfolioModel.quantity.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    TextSpan(
                                      text: '\nPurchase Price:',
                                      style:
                                          Theme.of(context).textTheme.overline,
                                    ),
                                    TextSpan(
                                      text: '\n' +
                                          portfolioModel.purchasePrice
                                              .toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    TextSpan(
                                      text: '\nPurchase Date: ',
                                      style:
                                          Theme.of(context).textTheme.overline,
                                    ),
                                    TextSpan(
                                      text: '\n' +
                                          dateFormat.format(
                                              portfolioModel.purchaseDate),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                              leading: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return PortfolioRemoveDialog(
                                        portfolioModel: portfolioModel,
                                        onRemove: () {
                                          context
                                              .read<PortfolioCubit>()
                                              .removeFromPortfolio(
                                                  portfolioModel.id ?? 0);
                                          Navigator.pop(context);
                                          context
                                              .read<
                                                  PortfolioMultiSymbolsCubit>()
                                              .getForMultiSymbols(symbolId);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(normalSnackBar(
                                            context: context,
                                            content:
                                                'Successfully removed from portfolio.',
                                          ));
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Divider(height: 0.0)
                        ],
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
          icon: Icon(Icons.check),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
