import 'package:my_share_nepal/helper/database.dart';
import 'package:my_share_nepal/model/symbol_todays_info_model.dart';
import 'package:sqflite/sqflite.dart';

class SymbolTodaysInfo {
  insertSymbolTodaysInfo(SymbolTodaysInfoModel symbolTodaysInfoModel) async {
    Database db = await AppDatabase().openAppDatabase();
    db.insert('SymbolTodaysInfo', symbolTodaysInfoModel.toMap());
    await db.close();
  }

  Future<List<SymbolTodaysInfoModel>> getSymbolTodaysInfo() async {
    Database db = await AppDatabase().openAppDatabase();
    List<Map<String, dynamic>> results = await db.query('SymbolTodaysInfo');
    await db.close();
    return List.generate(results.length, (index) {
      return SymbolTodaysInfoModel(
        sn: results[index]['sn'],
        symbol: results[index]['symbol'],
        stockConfidence: results[index]['stockConfidence'],
        open: results[index]['open'],
        high: results[index]['high'],
        low: results[index]['low'],
        close: results[index]['close'],
        vwap: results[index]['vwap'],
        volume: results[index]['volume'],
        previousClose: results[index]['previousClose'],
        turnover: results[index]['turnover'],
        transactions: results[index]['transactions'],
        difference: results[index]['difference'],
        range: results[index]['range'],
        differencePercentage: results[index]['differencePercentage'],
        rangePercentage: results[index]['rangePercentage'],
        vwapPercentage: results[index]['vwapPercentage'],
        oneTwentyDays: results[index]['oneTwentyDays'],
        oneEightyDays: results[index]['oneEightyDays'],
        fiftyTwoWeeksHigh: results[index]['fiftyTwoWeeksHigh'],
        fiftyTwoWeeksLow: results[index]['fiftyTwoWeeksLow'],
      );
    });
  }
}
