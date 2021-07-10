import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/cubit/symbols_cubit.dart';
import 'package:my_share_nepal/cubit/symbols_state.dart';
import 'package:my_share_nepal/model/portfolio.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:my_share_nepal/reusable/search_symbol_tile.dart';

class SearchPage extends SearchDelegate {
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
  Widget buildResults(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<SymbolsCubit>().getSymbols();
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          BlocBuilder<SymbolsCubit, SymbolsState>(
            builder: (_, symbolsState) {
              if (symbolsState is SymbolsInitial) {
                return SizedBox.shrink();
              } else if (symbolsState is SymbolsLoading) {
                return BigLoading();
              } else if (symbolsState is SymbolsError) {
                return BigError();
              } else if (symbolsState is SymbolsLoaded) {
                return Column(
                  children: (symbolsState).symbols.map<Widget>((symbol) {
                    return SearchSymbolTile(
                      title: symbol.symbol,
                      onAdd: () {
                        Portfolio().insertPortfolio(PortfolioModel(
                          symbolModel: symbol,
                          purchaseDate: DateTime.now(),
                          purchasePrice: 200.22,
                          quantity: 100,
                          symbolId: symbol.id ?? 1,
                        ));
                        context.read<PortfolioCubit>().getPortfolio();
                      },
                    );
                  }).toList(),
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
