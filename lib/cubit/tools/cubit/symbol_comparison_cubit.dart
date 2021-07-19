import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

part 'symbol_comparison_state.dart';

class SymbolComparisonCubit extends Cubit<SymbolComparisonState> {
  SymbolComparisonCubit() : super(SymbolComparisonInitial());

  resetSymbol() => emit(SymbolComparisonInitial());

  addSymbol(SymbolModel symbolModel) {
    try {
      if (state is SymbolComparisonAddedFrist) {
        var currentState = (state as SymbolComparisonAddedFrist);
        emit(SymbolComparisonAddedAll(
          symbolModelOne: currentState.symbolModel,
          symbolModelTwo: symbolModel,
        ));
      } else {
        emit(SymbolComparisonAddedFrist(symbolModel: symbolModel));
      }
    } catch (e) {
      emit(SymbolComparisonError());
    }
  }
}
