import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/symbols_cubit.dart';
import 'package:my_share_nepal/cubit/symbols_state.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Theme.of(context).primaryColorDark,
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          BlocBuilder<SymbolsCubit, SymbolsState>(
            builder: (_, symbolsState) {
              if (symbolsState is SymbolsInitial) {
                return SizedBox.shrink();
              } else if (symbolsState is SymbolsLoading) {
                return BigLoading();
              } else if (symbolsState is SymbolsError) {
                return BigError();
              } else {
                return Column(
                  children: (symbolsState as SymbolsLoaded)
                      .symbols
                      .map<Widget>((symbol) {
                    return Text(
                      symbol.symbol,
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(200)),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
