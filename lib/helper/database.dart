import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  Future<Database> openAppDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'demo.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        try {
          String sqlCreateSymbol =
              "CREATE TABLE Symbol(id INTEGER PRIMARY KEY, sn INTEGER, symbol TEXT, stockConfidence REAL, open REAL, high REAL, low REAL, close REAL, vwap REAL, volume INTEGER, previousClose REAL, turnover REAL, transactions INTEGER, difference REAL, range REAL, differencePercentage REAL, rangePercentage REAL, vwapPercentage REAL, oneTwentyDays REAL, oneEightyDays REAL, fiftyTwoWeeksHigh REAL, fiftyTwoWeeksLow REAL)";
          String sqlCreatePortfolio =
              "CREATE TABLE Portfolio(id INTEGER PRIMARY KEY, symbolId INTEGER, purchasePrice REAL, quantity INTEGER, purchaseDate TEXT, FOREIGN KEY (symbolId) REFERENCES Symbol (id))";
          await db.execute(sqlCreateSymbol);
          await db.execute(sqlCreatePortfolio);
        } catch (e) {
          print(e.toString());
        }
      },
    );
    return database;
  }
}
