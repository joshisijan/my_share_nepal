import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/symbols_cubit.dart';
import 'package:my_share_nepal/cubit/symbols_state.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:my_share_nepal/reusable/custom_button.dart';
import 'package:my_share_nepal/reusable/search_symbol_tile.dart';
import 'package:my_share_nepal/widget/add_portfolio_dialog.dart';
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
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(
      color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query == ''
        ? Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomButton(
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
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AddPortfolioDialog(symbol: symbol);
                              },
                            );
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
      scaffoldBackgroundColor: theme.primaryColor,
      primaryColor: theme.primaryColor,
      colorScheme: theme.colorScheme.copyWith(
        primary: theme.primaryColor,
      ),
      textSelectionTheme: theme.brightness == Brightness.dark
          ? TextSelectionThemeData(
              selectionColor: Theme.of(context).buttonColor,
              cursorColor: Theme.of(context).buttonColor,
            )
          : theme.textSelectionTheme,
      hintColor: theme.colorScheme.onPrimary.withAlpha(120),
      textTheme: theme.textTheme.copyWith(
        headline6: TextStyle(
          color: theme.colorScheme.onPrimary.withAlpha(200),
        ),
      ),
      appBarTheme: AppBarTheme(brightness: Brightness.dark),
    );
  }
}
