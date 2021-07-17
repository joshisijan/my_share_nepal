import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/symbols_cubit.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:my_share_nepal/reusable/search_tab/search_symbol_tile.dart';
import 'package:my_share_nepal/widget/portfolio_tab/add_portfolio_dialog.dart';
import 'package:my_share_nepal/widget/search_tab/no_search_result.dart';

class SearchPage extends SearchDelegate {
  final int searchIndex;
  SearchPage({
    this.searchIndex = 0,
  });
  bool showAllSelected = false;
  bool valueIncreasedSelected = false;
  bool constantValueSelected = false;
  bool valueDecreasedSelected = false;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    query = query.trim();
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
                  children: symbolsState.symbols.map<Widget>((symbolModel) {
                        return SearchSymbolTile(
                          searchIndex: searchIndex,
                          symbolModel: symbolModel,
                          onAdd: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AddPortfolioDialog(symbol: symbolModel);
                              },
                            );
                          },
                        );
                      }).toList() +
                      (symbolsState.symbols.length > 0
                          ? [
                              Divider(height: 0.0),
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
}
