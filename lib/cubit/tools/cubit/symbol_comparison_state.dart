part of 'symbol_comparison_cubit.dart';

class SymbolComparisonState {}

class SymbolComparisonInitial extends SymbolComparisonState {}

class SymbolComparisonLoading extends SymbolComparisonState {}

class SymbolComparisonError extends SymbolComparisonState {}

class SymbolComparisonAddedFrist extends SymbolComparisonState {
  final SymbolModel symbolModel;
  SymbolComparisonAddedFrist({
    required this.symbolModel,
  });
}

class SymbolComparisonAddedAll extends SymbolComparisonState {
  final SymbolModel symbolModelOne;
  final SymbolModel symbolModelTwo;
  SymbolComparisonAddedAll({
    required this.symbolModelOne,
    required this.symbolModelTwo,
  });
}
