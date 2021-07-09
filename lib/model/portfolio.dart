import 'package:my_share_nepal/helper/database.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:sqflite/sqflite.dart';

class Portfolio {
  insertPortfolio(PortfolioModel portfolioModel) async {
    Database db = await AppDatabase().openAppDatabase();
    db.insert('Portfolio', portfolioModel.toMap());
    await db.close();
  }

  Future<List<PortfolioModel>> getPortfolio() async {
    Database db = await AppDatabase().openAppDatabase();
    List<Map<String, dynamic>> portfolios = await db.query('Portfolio');
    await db.close();
    return List.generate(portfolios.length, (index) {
      return PortfolioModel(
        symbolId: portfolios[index]['symbolId'],
        purchasePrice: portfolios[index]['purchasePrice'],
        purchaseDate: DateTime.parse(portfolios[index]['purchaseDate']),
      );
    });
  }
}
