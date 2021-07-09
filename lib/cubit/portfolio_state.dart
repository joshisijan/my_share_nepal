import 'package:my_share_nepal/model/portfolio_model.dart';

abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioError extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioEmpty extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<PortfolioModel> portfolios;

  PortfolioLoaded({
    required this.portfolios,
  });
}
