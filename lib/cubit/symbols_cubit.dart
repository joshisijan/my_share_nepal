import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/cubit/symbols_state.dart';
import 'package:my_share_nepal/model/symbol.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

class SymbolsCubit extends Cubit<SymbolsState> {
  SymbolsCubit() : super(SymbolsInitial());

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

  getSymbols() async {
    if (state is SymbolsLoading) return;
    try {
      if (state is SymbolsInitial) emit(SymbolsLoading());
      List<SymbolModel> symbols = await Symbol().getAllSymbol();
      emit(SymbolsLoaded(
        symbols: [...symbols],
      ));
    } catch (e) {
      emit(SymbolsError());
    }
  }

  findSymbols(String query) async {
    if (state is SymbolsFindLoading) return;
    try {
      emit(SymbolsFindLoading());
      List<SymbolModel> symbols = await Symbol().findSymbol(query);
      emit(SymbolsFindLoaded(
        symbols: symbols,
      ));
    } catch (e) {
      print(e.toString());
      emit(SymbolsFindError());
    }
  }
}
