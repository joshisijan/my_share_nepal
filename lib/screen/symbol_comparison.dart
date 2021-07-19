import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/tools/cubit/symbol_comparison_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/helper/utilities.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/nothing_found.dart';
import 'package:my_share_nepal/screen/search_page.dart';
import 'package:my_share_nepal/widget/tools_tab/comparison_table.dart';

class SymbolComparisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparison'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (context.watch<SymbolComparisonCubit>().state
                is SymbolComparisonAddedAll)
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  normalSnackBar(
                    context: context,
                    content: 'Already added both. Remove one of them first.',
                  ),
                );
              }
            : () {
                showSearch(
                  context: context,
                  delegate: SearchPage(
                    searchIndex: 2,
                  ),
                );
              },
      ),
      body: BlocBuilder<SymbolComparisonCubit, SymbolComparisonState>(
        builder: (context, symbolComparisonState) {
          if (symbolComparisonState is SymbolComparisonInitial) {
            return NothingFound(
              icon: Icons.close,
              title: 'Nothing added for comparison',
              text: 'Use add button to add to comparison',
            );
          } else if (symbolComparisonState is SymbolComparisonError) {
            return BigError(
              onReload: () {
                context.read<SymbolComparisonCubit>().resetSymbol();
              },
            );
          } else if (symbolComparisonState is SymbolComparisonAddedFirst) {
            return ComparisonTable(
              symbolModelOne: symbolComparisonState.symbolModel,
            );
          } else if (symbolComparisonState is SymbolComparisonAddedAll) {
            return ComparisonTable(
              symbolModelOne: symbolComparisonState.symbolModelOne,
              symbolModelTwo: symbolComparisonState.symbolModelTwo,
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
