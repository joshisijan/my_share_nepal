import 'package:my_share_nepal/helper/database.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:sqflite/sqflite.dart';

class Symbol {
  insertSymbol(SymbolModel symbolModel) async {
    Database db = await AppDatabase().openAppDatabase();
    db.insert('Symbol', symbolModel.toMap());
    await db.close();
  }

  Future<List<SymbolModel>> getAllSymbol() async {
    Database db = await AppDatabase().openAppDatabase();
    List<Map<String, dynamic>> symbols = await db.query('Symbol');
    await db.close();
    return List.generate(symbols.length, (index) {
      return SymbolModel(
        id: symbols[index]['id'],
        sn: symbols[index]['sn'],
        symbol: symbols[index]['symbol'],
        stockConfidence: symbols[index]['stockConfidence'],
        open: symbols[index]['open'],
        high: symbols[index]['high'],
        low: symbols[index]['low'],
        close: symbols[index]['close'],
        vwap: symbols[index]['vwap'],
        volume: symbols[index]['volume'],
        previousClose: symbols[index]['previousClose'],
        turnover: symbols[index]['turnover'],
        transactions: symbols[index]['transactions'],
        difference: symbols[index]['difference'],
        range: symbols[index]['range'],
        differencePercentage: symbols[index]['differencePercentage'],
        rangePercentage: symbols[index]['rangePercentage'],
        vwapPercentage: symbols[index]['vwapPercentage'],
        oneTwentyDays: symbols[index]['oneTwentyDays'],
        oneEightyDays: symbols[index]['oneEightyDays'],
        fiftyTwoWeeksHigh: symbols[index]['fiftyTwoWeeksHigh'],
        fiftyTwoWeeksLow: symbols[index]['fiftyTwoWeeksLow'],
      );
    });
  }

  Future<SymbolModel?> getSymbol(int id) async {
    Database db = await AppDatabase().openAppDatabase();
    List<Map<String, dynamic>> symbol =
        await db.query('Symbol', where: 'id = ?', whereArgs: [id]);
    await db.close();
    if (symbol.length <= 0) return null;
    return SymbolModel(
      id: symbol[0]['id'],
      sn: symbol[0]['sn'],
      symbol: symbol[0]['symbol'],
      stockConfidence: symbol[0]['stockConfidence'],
      open: symbol[0]['open'],
      high: symbol[0]['high'],
      low: symbol[0]['low'],
      close: symbol[0]['close'],
      vwap: symbol[0]['vwap'],
      volume: symbol[0]['volume'],
      previousClose: symbol[0]['previousClose'],
      turnover: symbol[0]['turnover'],
      transactions: symbol[0]['transactions'],
      difference: symbol[0]['difference'],
      range: symbol[0]['range'],
      differencePercentage: symbol[0]['differencePercentage'],
      rangePercentage: symbol[0]['rangePercentage'],
      vwapPercentage: symbol[0]['vwapPercentage'],
      oneTwentyDays: symbol[0]['oneTwentyDays'],
      oneEightyDays: symbol[0]['oneEightyDays'],
      fiftyTwoWeeksHigh: symbol[0]['fiftyTwoWeeksHigh'],
      fiftyTwoWeeksLow: symbol[0]['fiftyTwoWeeksLow'],
    );
  }
}