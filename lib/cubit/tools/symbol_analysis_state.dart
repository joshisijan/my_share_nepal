part of 'symbol_analysis_cubit.dart';

class SymbolAnalysisState {}

class SymbolAnalysisInitial extends SymbolAnalysisState {}

class SymbolAnalysisLoading extends SymbolAnalysisState {}

class SymbolAnalysisError extends SymbolAnalysisState {}

class SymbolAnalysisLoaded extends SymbolAnalysisState {
  final SymbolModel symbolModel;

  SymbolAnalysisLoaded({
    required this.symbolModel,
  });
}
