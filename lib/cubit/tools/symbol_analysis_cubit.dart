import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/model/symbol.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

part 'symbol_analysis_state.dart';

class SymbolAnalysisCubit extends Cubit<SymbolAnalysisState> {
  SymbolAnalysisCubit() : super(SymbolAnalysisInitial());

  symbolAnalysis(int id) async {
    try {
      emit(SymbolAnalysisLoading());

      SymbolModel? symbolModel = await Symbol().getSymbol(id);

      await Symbol().fetchSymbols();

      if (symbolModel == null) {
        emit(SymbolAnalysisError());
      } else {
        emit(SymbolAnalysisLoaded(
          symbolModel: symbolModel,
        ));
      }
    } catch (e) {
      emit(SymbolAnalysisError());
    }
  }
}
