import 'package:my_share_nepal/model/symbol_model.dart';

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

class SymbolsFetchLoading extends SymbolsState {}

class SymbolsFetchError extends SymbolsState {}

class SymbolsFetchErrorEnd extends SymbolsState {}

class SymbolsFetchLoaded extends SymbolsState {}

class SymbolsFetchLoadedEnd extends SymbolsState {}

class SymbolsFindLoading extends SymbolsState {}

class SymbolsFindError extends SymbolsState {}

class SymbolsFindLoaded extends SymbolsState {
  List<SymbolModel> symbols;

  SymbolsFindLoaded({
    symbols,
  }) : symbols = symbols ?? [];
}
