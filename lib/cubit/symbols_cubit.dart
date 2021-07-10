import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/cubit/symbols_state.dart';
import 'package:my_share_nepal/model/symbol.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

class SymbolsCubit extends Cubit<SymbolsState> {
  SymbolsCubit() : super(SymbolsInitial());

  // fetchSymbols() async {
  //   emit(SymbolsFetchInitial());
  //   try {
  //     emit(SymbolsFetchLoading());
  //     await Symbol().fetchSymbols();
  //     emit(SymbolsFetchLoaded());
  //     getSymbols();
  //   } catch (e) {
  //     emit(SymbolsFetchError());
  //   }
  // }

  getSymbols() async {
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
