part of 'portfolio_cubit.dart';

abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioError extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<PortfolioModel> portfolioModels;

  PortfolioLoaded({
    portfolioModels,
  }) : portfolioModels = portfolioModels ?? [];
}
