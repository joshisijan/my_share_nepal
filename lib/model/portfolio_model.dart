import 'package:my_share_nepal/model/symbol_model.dart';

class PortfolioModel {
  SymbolModel? symbolModel;
  final int symbolId;
  final double purchasePrice;
  final DateTime purchaseDate;

  PortfolioModel({
    this.symbolModel,
    required this.symbolId,
    required this.purchasePrice,
    required this.purchaseDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'symbolId': symbolId,
      'purchasePrice': purchasePrice,
      'purchaseDate': purchaseDate.toString(),
    };
  }
}
