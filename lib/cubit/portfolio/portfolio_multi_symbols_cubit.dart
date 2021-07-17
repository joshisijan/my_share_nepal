import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/model/portfolio.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/model/symbol.dart';

part 'portfolio_multi_symbols_state.dart';

class PortfolioMultiSymbolsCubit extends Cubit<PortfolioMultiSymbolsState> {
  PortfolioMultiSymbolsCubit() : super(PortfolioMultiSymbolsInitial());

  getForMultiSymbols(int symbolId) async {
    if (state is PortfolioMultiSymbolsLoading) return;
    try {
      if (state is PortfolioMultiSymbolsInitial)
        emit(PortfolioMultiSymbolsLoading());
      List<PortfolioModel> portfolioModels =
          await Portfolio().getForMultiSymbols(symbolId);
      for (int i = 0; i < portfolioModels.length; i++) {
        SymbolModel? symbolModel =
            await Symbol().getSymbol(portfolioModels[i].symbolId);
        if (symbolModel != null) {
          portfolioModels[i].symbolModel = symbolModel;
        }
      }
      emit(PortfolioMultiSymbolsLoaded(
        portfolioModels: [...portfolioModels],
      ));
    } catch (e) {
      emit(PortfolioMultiSymbolsError());
    }
  }
}
