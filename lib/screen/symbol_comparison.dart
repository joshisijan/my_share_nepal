import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/tools/cubit/symbol_comparison_cubit.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/reusable/big_loading.dart';
import 'package:my_share_nepal/reusable/nothing_found.dart';
import 'package:my_share_nepal/screen/search_page.dart';

class SymbolComparisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparison'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
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
          } else if (symbolComparisonState is SymbolComparisonLoading) {
            return BigLoading();
          } else if (symbolComparisonState is SymbolComparisonError) {
            return BigError(
              onReload: () {
                context.read<SymbolComparisonCubit>().resetSymbol();
              },
            );
          } else if (symbolComparisonState is SymbolComparisonAddedAll) {
            return Table(
              children: [
                TableRow(
                  children: [
                    TableCell(child: Text('')),
                  ],
                ),
              ],
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
