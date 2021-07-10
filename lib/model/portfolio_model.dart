import 'package:my_share_nepal/model/symbol_model.dart';

class PortfolioModel {
  int? id;
  SymbolModel? symbolModel;
  final int symbolId;
  final double purchasePrice;
  final int quantity;
  final DateTime purchaseDate;

  PortfolioModel({
    this.id,
    this.symbolModel,
    required this.symbolId,
    required this.purchasePrice,
    required this.quantity,
    required this.purchaseDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'symbolId': symbolId,
      'purchasePrice': purchasePrice,
      'quantity': quantity,
      'purchaseDate': purchaseDate.toString(),
    };
  }
}
