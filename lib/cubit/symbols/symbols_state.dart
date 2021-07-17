part of 'symbols_cubit.dart';

abstract class SymbolsState {}

class SymbolsInitial extends SymbolsState {}

class SymbolsError extends SymbolsState {}

class SymbolsLoading extends SymbolsState {}

class SymbolsLoaded extends SymbolsState {
  List<SymbolModel> symbols;

  SymbolsLoaded({
    symbols,
  }) : symbols = symbols ?? [];
}

class SymbolsFindLoading extends SymbolsState {}

class SymbolsFindError extends SymbolsState {}

class SymbolsFindLoaded extends SymbolsState {
  final List<SymbolModel> symbols;

  SymbolsFindLoaded({
    symbols,
  }) : symbols = symbols ?? [];
}
