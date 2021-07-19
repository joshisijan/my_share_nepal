part of 'symbol_comparison_cubit.dart';

class SymbolComparisonState {}

class SymbolComparisonInitial extends SymbolComparisonState {}

class SymbolComparisonAddedOne extends SymbolComparisonState {
  final SymbolModel symbolModel;
  SymbolComparisonAddedOne({
    required this.symbolModel,
  });
}

class SymbolComparisonAddedTwo extends SymbolComparisonState {
  final SymbolModel symbolModelOne;
  final SymbolModel symbolModelTwo;
  SymbolComparisonAddedTwo({
    required this.symbolModelOne,
    required this.symbolModelTwo,
  });
}
