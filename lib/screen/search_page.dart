import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/cubit/symbols_cubit.dart';
import 'package:my_share_nepal/cubit/symbols_state.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:my_share_nepal/reusable/custom_button_on_dark.dart';
import 'package:my_share_nepal/reusable/search_symbol_tile.dart';
import 'package:my_share_nepal/widget/no_search_result.dart';

class SearchPage extends SearchDelegate {
  final int searchIndex;
  SearchPage({
    this.searchIndex = 0,
  });
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(
      color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query == ''
        ? Container(
            width: double.maxFinite,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomButtonOnDark(
                    text: 'Show all',
                    onPressed: () {
                      query = '';
                      showResults(context);
                    },
                  ),
                ),
              ],
            ),
          )
        : Container(
            color: Theme.of(context).primaryColor,
          );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != '') {
      // add code for recent search
    }
    context.read<SymbolsCubit>().findSymbols(query);
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          BlocBuilder<SymbolsCubit, SymbolsState>(
            builder: (_, symbolsState) {
              if (symbolsState is SymbolsInitial) {
                return SizedBox.shrink();
              } else if (symbolsState is SymbolsFindLoading) {
                return BigLoading();
              } else if (symbolsState is SymbolsFindError) {
                return BigError();
              } else if (symbolsState is SymbolsFindLoaded) {
                if (symbolsState.symbols.length <= 0) {
                  return NoSearchResult();
                }
                return Column(
                  children: symbolsState.symbols.map<Widget>((symbol) {
                        return SearchSymbolTile(
                          searchIndex: searchIndex,
                          title: symbol.symbol,
                          onAdd: () {
                            context
                                .read<PortfolioCubit>()
                                .insertSymbol(PortfolioModel(
                                  symbolModel: symbol,
                                  purchaseDate: DateTime.now(),
                                  purchasePrice: 200.22,
                                  quantity: 100,
                                  symbolId: symbol.id ?? 0,
                                ));
                          },
                        );
                      }).toList() +
                      (symbolsState.symbols.length > 0
                          ? [
                              Divider(
                                color: Theme.of(context).primaryColorLight,
                                height: 0.0,
                              ),
                            ]
                          : []),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
      ),
      primaryColor: theme.primaryColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: theme.primaryColorLight,
        selectionColor: theme.primaryColorLight,
        selectionHandleColor: theme.colorScheme.onPrimary,
      ),
      colorScheme: theme.colorScheme.copyWith(
        primary: theme.primaryColor,
      ),
      hintColor: theme.colorScheme.onPrimary.withAlpha(120),
      textTheme: theme.textTheme.copyWith(
        headline6: TextStyle(
          color: theme.colorScheme.onPrimary.withAlpha(200),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
