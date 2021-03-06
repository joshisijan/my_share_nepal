import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/cubit/portfolio/portfolio_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/helper/utilities.dart';
import 'package:my_share_nepal/model/portfolio.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/reusable/custom_popup_menu_button.dart';
import 'package:my_share_nepal/screen/symbol_detail_page.dart';
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
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");

  @override
  Widget build(BuildContext context) {
    SymbolModel? symbolModel = portfolioModel.symbolModel;
    return Column(
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.all(kDefaultPadding / 2),
          child: Row(
            children: [
              CustomPopupMenuButton(
                onSelected: (value) {
                  if (value == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => SymbolDetailPage(
                        symbolModel: symbolModel,
                      ),
                    ));
                  } else if (value == 1) {
                    showPortfolioDetailDialog(context);
                  } else if (value == 2) {
                    showPortfolioEditDialog(context);
                  } else if (value == 3) {
                    showPortfolioRemoveDialog(context);
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 0,
                      child: ListTile(
                        leading: Icon(Icons.feed),
                        title: Text('Detail'),
                        dense: true,
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        leading: Icon(Icons.summarize_outlined),
                        title: Text('Portfolio Detail'),
                        dense: true,
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Edit'),
                        dense: true,
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Remove'),
                        dense: true,
                      ),
                    ),
                  ];
                },
              ),
              Text(
                symbolModel == null ? 'Error' : symbolModel.symbol,
                style: Theme.of(context).textTheme.subtitle2,
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
                      style: Theme.of(context).textTheme.subtitle2,
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
                        color:
                            Theme.of(context).primaryColorLight.withAlpha(50),
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
                                        ? null
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
                                              ? null
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
