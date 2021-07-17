import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/model/symbol.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

part '../symbols/symbols_state.dart';

class SymbolsCubit extends Cubit<SymbolsState> {
  SymbolsCubit() : super(SymbolsInitial());

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
      emit(SymbolsFindError());
    }
  }
}
