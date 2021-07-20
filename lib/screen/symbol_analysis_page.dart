import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/tools/symbol_analysis_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/reusable/big_error.dart';
import 'package:my_share_nepal/widget/tools_tab/analysis_gauge.dart';

class SymbolAnalysisPage extends StatelessWidget {
  final SymbolModel? symbolModel;
  SymbolAnalysisPage({
    required this.symbolModel,
  });

  @override
  Widget build(BuildContext context) {
    context.read<SymbolAnalysisCubit>().symbolAnalysis(symbolModel!.id ?? 0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          symbolModel!.symbol,
        ),
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          SizedBox(
            height: kDoublePadding,
          ),
          Text(
            'Analysis \nof \n' + symbolModel!.symbol,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(
            height: kDoublePadding,
          ),
          BlocBuilder<SymbolAnalysisCubit, SymbolAnalysisState>(
            builder: (_, symbolAnalysisState) {
              if (symbolAnalysisState is SymbolAnalysisLoading) {
                return AnalysisGauge();
              } else if (symbolAnalysisState is SymbolAnalysisLoaded) {
                return AnalysisGauge(
                  value: symbolAnalysisState.symbolModel.stockConfidence / 100,
                );
              } else if (symbolAnalysisState is SymbolAnalysisError) {
                return BigError(
                  noTopPadding: true,
                  onReload: () {
                    context
                        .read<SymbolAnalysisCubit>()
                        .symbolAnalysis(symbolModel!.id ?? 0);
                  },
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
