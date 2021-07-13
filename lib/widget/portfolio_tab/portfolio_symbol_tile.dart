import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/helper/utilities.dart';
import 'package:my_share_nepal/model/portfolio.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/reusable/custom_popup_menu_button.dart';
import 'package:my_share_nepal/reusable/custom_popup_menu_item.dart';
import 'package:my_share_nepal/widget/portfolio_tab/detail_portfolio_dialog.dart';
import 'package:my_share_nepal/widget/portfolio_tab/edit_portfolio_dialog.dart';
import 'package:my_share_nepal/widget/portfolio_tab/multi_portfolio_detail_dialog.dart';
import 'package:my_share_nepal/widget/portfolio_tab/multi_portfolio_edit_dialog.dart';
import 'package:my_share_nepal/widget/portfolio_tab/multi_portfolio_remove_dialog.dart';
import 'package:my_share_nepal/widget/portfolio_tab/remove_portfolio_dialog.dart';

class PortfolioSymbolTile extends StatelessWidget {
  final PortfolioModel portfolioModel;
  final int? id;
  PortfolioSymbolTile({
    required this.portfolioModel,
    required this.id,
  });
  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,###.0#", "en_US");

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
              CustomPopupMenuButton(
                onSelected: (value) {
                  if (value == 0) {
                    showPortfolioDetailDialog(context);
                  } else if (value == 1) {
                    showPortfolioEditDialog(context);
                  } else if (value == 2) {
                    showPortfolioRemoveDialog(context);
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 0,
                      child: CustomPopupMenuItem(
                        icon: Icons.feed,
                        title: 'Detail',
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: CustomPopupMenuItem(
                        icon: Icons.edit,
                        title: 'Edit',
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: CustomPopupMenuItem(
                        icon: Icons.delete,
                        title: 'Remove',
                      ),
                    ),
                  ];
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

  showPortfolioRemoveDialog(BuildContext context) async {
    List<PortfolioModel> portfolioModels =
        await Portfolio().getForMultiSymbols(portfolioModel.symbolId);
    // if portfolio have same share added multiple time
    if (portfolioModels.length > 1) {
      showDialog(
        context: context,
        builder: (context) {
          return MultiPortfolioRemoveDialog(
            symbolId: portfolioModel.symbolId,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return PortfolioRemoveDialog(
            portfolioModel: portfolioModel,
            onRemove: () {
              context.read<PortfolioCubit>().removeFromPortfolio(id ?? 0);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(normalSnackBar(
                context: context,
                content: 'Successfully removed from portfolio.',
              ));
            },
          );
        },
      );
    }
  }

  showPortfolioEditDialog(BuildContext context) async {
    List<PortfolioModel> portfolioModels =
        await Portfolio().getForMultiSymbols(portfolioModel.symbolId);
    // if portfolio have same share added multiple time
    if (portfolioModels.length > 1) {
      showDialog(
        context: context,
        builder: (context) {
          return MultiPortfolioEditDialog(
            symbolId: portfolioModel.symbolId,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return EditPortfolioDialog(
            portfolioModel: portfolioModel,
          );
        },
      );
    }
  }

  showPortfolioDetailDialog(BuildContext context) async {
    List<PortfolioModel> portfolioModels =
        await Portfolio().getForMultiSymbols(portfolioModel.symbolId);
    // if portfolio have same share added multiple time
    if (portfolioModels.length > 1) {
      showDialog(
        context: context,
        builder: (context) {
          return MultiPortfolioDetailDialog(symbolId: portfolioModel.symbolId);
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return DetailPortfolioDialog(portfolioModel: portfolioModel);
        },
      );
    }
  }
}
