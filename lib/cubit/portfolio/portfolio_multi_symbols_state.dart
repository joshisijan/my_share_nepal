part of 'portfolio_multi_symbols_cubit.dart';

abstract class PortfolioMultiSymbolsState {}

class PortfolioMultiSymbolsInitial extends PortfolioMultiSymbolsState {}

class PortfolioMultiSymbolsLoading extends PortfolioMultiSymbolsState {}

class PortfolioMultiSymbolsError extends PortfolioMultiSymbolsState {}

class PortfolioMultiSymbolsLoaded extends PortfolioMultiSymbolsState {
  final List<PortfolioModel> portfolioModels;

  PortfolioMultiSymbolsLoaded({
    portfolioModels,
  }) : portfolioModels = portfolioModels ?? [];
}
