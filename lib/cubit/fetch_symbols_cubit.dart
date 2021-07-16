import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_share_nepal/model/symbol.dart';

part 'fetch_symbols_state.dart';

class FetchSymbolsCubit extends Cubit<FetchSymbolsState> {
  FetchSymbolsCubit() : super(FetchSymbolsInitial());

  fetchSymbols() async {
    if (state is SymbolsFetchLoading) return;
    try {
      emit(SymbolsFetchLoading());
      await Symbol().fetchSymbols();
      emit(SymbolsFetchLoaded());
      await Future.delayed(Duration(seconds: 2));
      emit(SymbolsFetchLoadedEnd());
    } catch (e) {
      emit(SymbolsFetchError());
      await Future.delayed(Duration(seconds: 2));
      emit(SymbolsFetchErrorEnd());
    }
  }

  autoFetchSymbols() async {
    await fetchSymbols();
    await Future.delayed(Duration(minutes: 2));
    autoFetchSymbols();
  }
}
