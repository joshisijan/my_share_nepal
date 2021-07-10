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

  getSymbols() async {
    if(state is SymbolsLoading) return;
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
}
