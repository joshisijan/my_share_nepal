import 'dart:convert';

import 'package:my_share_nepal/helper/api.dart';
import 'package:my_share_nepal/helper/database.dart';
import 'package:my_share_nepal/helper/utilities.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class Symbol {
  insertSymbol(SymbolModel symbolModel) async {
    Database db = await AppDatabase().openAppDatabase();
    db.insert('Symbol', symbolModel.toMap());
    await db.close();
  }

  insertSymbols(List<SymbolModel> symbols) async {
    Database db = await AppDatabase().openAppDatabase();
    Batch batch = db.batch();
    symbols.forEach((symbol) async {
      List<Map<String, dynamic>> result = await db
          .query('Symbol', where: 'symbol = ?', whereArgs: [symbol.symbol]);
      if (result.length > 0)
        batch.update('Symbol', symbol.toMap(),
            where: 'symbol = ?', whereArgs: [symbol.symbol]);
      else
        batch.insert('Symbol', symbol.toMap());
    });
    await batch.commit();
    await db.close();
  }

  Future<List<SymbolModel>> getAllSymbol() async {
    Database db = await AppDatabase().openAppDatabase();
    List<Map<String, dynamic>> symbols = await db.query('Symbol');
    await db.close();
    return List.generate(symbols.length, (index) {
      return SymbolModel(
        id: symbols[index]['id'],
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

  Future<List<SymbolModel>> findSymbol(String query) async {
    Database db = await AppDatabase().openAppDatabase();
    List<Map<String, dynamic>> symbols = await db.query('Symbol',
        where: 'symbol like ?', whereArgs: ['%' + query + '%']);
    await db.close();
    return List.generate(symbols.length, (index) {
      return SymbolModel(
        id: symbols[index]['id'],
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

  fetchSymbols() async {
    http.Response response = await http.get(Uri.parse(kTodaysDetailUrl));
    if (response.statusCode == 200) {
      var jsonData = await jsonDecode(response.body);
      List<SymbolModel> symbols = [];
      jsonData.forEach((symbolData) {
        SymbolModel symbolModel = SymbolModel(
          symbol: symbolData['symbol'],
          open: stringToDouble(symbolData['open']),
          close: stringToDouble(symbolData['close']),
          high: stringToDouble(symbolData['high']),
          low: stringToDouble(symbolData['low']),
          turnover: stringToDouble(symbolData['turnover']),
          difference: stringToDouble(symbolData['difference']),
          differencePercentage:
              stringToDouble(symbolData['differencePercentage']),
          range: stringToDouble(symbolData['range']),
          rangePercentage: stringToDouble(symbolData['rangePercentage']),
          vwap: stringToDouble(symbolData['vwap']),
          vwapPercentage: stringToDouble(symbolData['vwapPercentage']),
          previousClose: stringToDouble(symbolData['previousClose']),
          stockConfidence: stringToDouble(symbolData['stockConfidence']),
          fiftyTwoWeeksHigh: stringToDouble(symbolData['fiftyTwoWeeksHigh']),
          fiftyTwoWeeksLow: stringToDouble(symbolData['fiftyTwoWeeksLow']),
          oneTwentyDays: symbolData['oneTwentyDays'] == '-'
              ? null
              : stringToDouble(symbolData['oneTwentyDays']),
          oneEightyDays: symbolData['oneEightyDays'] == '-'
              ? null
              : stringToDouble(symbolData['oneEightyDays']),
          volume: stringToDouble(symbolData['volume']).toInt(),
          transactions: stringToDouble(symbolData['transactions']).toInt(),
        );
        symbols.add(symbolModel);
      });
      await insertSymbols(symbols);
    } else {
      throw Error();
    }
  }
}
