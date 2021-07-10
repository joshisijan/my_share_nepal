import 'package:bloc/bloc.dart';
import 'package:my_share_nepal/cubit/portfolio_state.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/model/portfolio.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/model/symbol.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial());

  getPortfolio() async {
    if (state is PortfolioLoading) return;
    try {
      if (state is PortfolioInitial) emit(PortfolioLoading());
      List<PortfolioModel> portfolios = await Portfolio().getPortfolio();
      for (int i = 0; i < portfolios.length; i++) {
        SymbolModel? symbolModel =
            await Symbol().getSymbol(portfolios[i].symbolId);
        if (symbolModel != null) {
          portfolios[i].symbolModel = symbolModel;
        }
      }
      emit(PortfolioLoaded(
        portfolios: [...portfolios],
      ));
    } catch (e) {
      print(e.toString());
      emit(PortfolioError());
    }
  }

  insertSymbol(PortfolioModel portfolioModel) async {
    await Portfolio().insertPortfolio(portfolioModel);
    getPortfolio();
  }

  removeSymbol(int id) async {
    await Portfolio().deleteSymbol(id);
    getPortfolio();
  }
}
