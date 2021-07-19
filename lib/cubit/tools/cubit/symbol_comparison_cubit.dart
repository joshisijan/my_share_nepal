import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

part 'symbol_comparison_state.dart';

class SymbolComparisonCubit extends Cubit<SymbolComparisonState> {
  SymbolComparisonCubit() : super(SymbolComparisonInitial());

  resetSymbol() => emit(SymbolComparisonInitial());

  addSymbol(SymbolModel symbolModel) {
    try {
      if (state is SymbolComparisonAddedFirst) {
        var currentState = (state as SymbolComparisonAddedFirst);
        emit(SymbolComparisonAddedAll(
          symbolModelOne: currentState.symbolModel,
          symbolModelTwo: symbolModel,
        ));
      } else {
        emit(SymbolComparisonAddedFirst(symbolModel: symbolModel));
      }
    } catch (e) {
      emit(SymbolComparisonError());
    }
  }

  removeSymbol(int index) {
    if (state is SymbolComparisonAddedAll ||
        state is SymbolComparisonAddedFirst) {
      if (state is SymbolComparisonAddedAll) {
        var currentState = (state as SymbolComparisonAddedAll);
        if (index == 0)
          emit(SymbolComparisonAddedFirst(
            symbolModel: currentState.symbolModelTwo,
          ));
        else
          emit(SymbolComparisonAddedFirst(
            symbolModel: currentState.symbolModelOne,
          ));
      } else {
        emit(SymbolComparisonInitial());
      }
    }
  }
}
