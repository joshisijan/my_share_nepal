import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

part 'symbol_comparison_state.dart';

class SymbolComparisonCubit extends Cubit<SymbolComparisonState> {
  SymbolComparisonCubit() : super(SymbolComparisonInitial());

  resetSymbol() => emit(SymbolComparisonInitial());

  addSymbol(SymbolModel symbolModel) {
    if (state is SymbolComparisonInitial) {
      emit(SymbolComparisonAddedOne(
        symbolModel: symbolModel,
      ));
    } else if (state is SymbolComparisonAddedOne) {
      var currentState = (state as SymbolComparisonAddedOne);
      emit(SymbolComparisonAddedTwo(
        symbolModelOne: currentState.symbolModel,
        symbolModelTwo: symbolModel,
      ));
    }
  }

  removeSymbol(int index) {
    if (state is SymbolComparisonAddedOne) {
      emit(SymbolComparisonInitial());
    } else if (state is SymbolComparisonAddedTwo) {
      var currentState = (state as SymbolComparisonAddedTwo);
      if (index == 0)
        emit(SymbolComparisonAddedOne(
          symbolModel: currentState.symbolModelTwo,
        ));
      else
        emit(SymbolComparisonAddedOne(
          symbolModel: currentState.symbolModelOne,
        ));
    }
  }
}
