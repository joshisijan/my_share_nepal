import 'package:my_share_nepal/model/portfolio_model.dart';

abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioError extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  List<PortfolioModel> portfolios;

  PortfolioLoaded({
    portfolios,
  }) : portfolios = portfolios ?? [];
}
