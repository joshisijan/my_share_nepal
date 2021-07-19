import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/tools/symbol_comparison_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/tools_card.dart';
import 'package:my_share_nepal/screen/search_page.dart';
import 'package:my_share_nepal/widget/tools_tab/comparison_detail.dart';

class SymbolComparisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparison'),
      ),
      body: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          BlocBuilder<SymbolComparisonCubit, SymbolComparisonState>(
              builder: (context, symbolComparisonState) {
            if (symbolComparisonState is SymbolComparisonInitial) {
              return Wrap(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30.0,
                    child: ToolsCard(
                      icon: Icons.add,
                      title: 'Add to compare',
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchPage(
                            searchIndex: 2,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: kDefaultPadding),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30.0,
                    child: ToolsCard(
                      icon: Icons.add,
                      title: 'Add to compare',
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchPage(
                            searchIndex: 2,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (symbolComparisonState is SymbolComparisonAddedOne) {
              return Wrap(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30.0,
                    child: ToolsCard(
                      icon: Icons.close,
                      isError: true,
                      title: symbolComparisonState.symbolModel.symbol,
                      onPressed: () {
                        context.read<SymbolComparisonCubit>().removeSymbol(0);
                      },
                    ),
                  ),
                  SizedBox(width: kDefaultPadding),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30.0,
                    child: ToolsCard(
                      icon: Icons.add,
                      title: 'Add to compare',
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchPage(
                            searchIndex: 2,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              symbolComparisonState as SymbolComparisonAddedTwo;
              return Column(
                children: [
                  Wrap(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30.0,
                        child: ToolsCard(
                          icon: Icons.close,
                          isError: true,
                          title: symbolComparisonState.symbolModelOne.symbol,
                          onPressed: () {
                            context
                                .read<SymbolComparisonCubit>()
                                .removeSymbol(0);
                          },
                        ),
                      ),
                      SizedBox(width: kDefaultPadding),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30.0,
                        child: ToolsCard(
                          icon: Icons.close,
                          isError: true,
                          title: symbolComparisonState.symbolModelTwo.symbol,
                          onPressed: () {
                            context
                                .read<SymbolComparisonCubit>()
                                .removeSymbol(1);
                          },
                        ),
                      ),
                    ],
                  ),
                  ComparisonDetail(
                    symbolModelOne: symbolComparisonState.symbolModelOne,
                    symbolModelTwo: symbolComparisonState.symbolModelTwo,
                  ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
