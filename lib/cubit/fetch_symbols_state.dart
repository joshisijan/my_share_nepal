part of 'fetch_symbols_cubit.dart';

@immutable
abstract class FetchSymbolsState {}

class FetchSymbolsInitial extends FetchSymbolsState {}

class SymbolsFetchLoading extends FetchSymbolsState {}

class SymbolsFetchError extends FetchSymbolsState {}

class SymbolsFetchErrorEnd extends FetchSymbolsState {}

class SymbolsFetchLoaded extends FetchSymbolsState {}

class SymbolsFetchLoadedEnd extends FetchSymbolsState {}
