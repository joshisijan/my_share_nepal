import 'package:my_share_nepal/helper/database.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:sqflite/sqflite.dart';

class Portfolio {
  insertPortfolio(PortfolioModel portfolioModel) async {
    Database db = await AppDatabase().openAppDatabase();
    await db.insert('Portfolio', portfolioModel.toMap());
    await db.close();
  }

  Future<List<PortfolioModel>> getPortfolio() async {
    Database db = await AppDatabase().openAppDatabase();
    List<Map<String, dynamic>> result = await db.query('Portfolio');
    await db.close();
    return List.generate(result.length, (index) {
      return PortfolioModel(
        id: result[index]['id'],
        symbolId: result[index]['symbolId'],
        quantity: result[index]['quantity'],
        purchasePrice: result[index]['purchasePrice'],
        purchaseDate: DateTime.parse(result[index]['purchaseDate']),
      );
    });
  }

  deleteSymbol(int id) async {
    Database db = await AppDatabase().openAppDatabase();
    await db.delete('Portfolio', where: 'id = ?', whereArgs: [id]);
    await db.close();
  }

  Future<List<PortfolioModel>> getForMultiSymbols(int id) async {
    Database db = await AppDatabase().openAppDatabase();
    List<Map<String, dynamic>> result =
        await db.query('Portfolio', where: 'symbolId = ?', whereArgs: [id]);
    await db.close();
    return List.generate(result.length, (index) {
      return PortfolioModel(
        id: result[index]['id'],
        symbolId: result[index]['symbolId'],
        quantity: result[index]['quantity'],
        purchasePrice: result[index]['purchasePrice'],
        purchaseDate: DateTime.parse(result[index]['purchaseDate']),
      );
    });
  }
}
