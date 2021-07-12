import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/model/portfolio.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/model/symbol.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial());

  getPortfolio() async {
    if (state is PortfolioLoading) return;
    try {
      if (state is PortfolioInitial) emit(PortfolioLoading());
      List<PortfolioModel> portfolioModels = await Portfolio().getPortfolio();
      for (int i = 0; i < portfolioModels.length; i++) {
        SymbolModel? symbolModel =
            await Symbol().getSymbol(portfolioModels[i].symbolId);
        if (symbolModel != null) {
          portfolioModels[i].symbolModel = symbolModel;
        }
      }
      emit(PortfolioLoaded(
        portfolioModels: [...portfolioModels],
      ));
    } catch (e) {
      emit(PortfolioError());
    }
  }

  insertSymbol(PortfolioModel portfolioModel) async {
    await Portfolio().insertPortfolio(portfolioModel);
    getPortfolio();
  }

  removeFromPortfolio(int id) async {
    await Portfolio().deleteSymbol(id);
    getPortfolio();
  }
}
