class SymbolTodaysInfoModel {
  final int sn;
  final String symbol;
  final double stockConfidence;
  final double open;
  final double high;
  final double low;
  final double close;
  final double vwap;
  final int volume;
  final double previousClose;
  final double turnover;
  final int transactions;
  final double difference;
  final double range;
  final double differencePercentage;
  final double rangePercentage;
  final double vwapPercentage;
  final double oneTwentyDays;
  final double oneEightyDays;
  final double fiftyTwoWeeksHigh;
  final double fiftyTwoWeeksLow;

  SymbolTodaysInfoModel({
    required this.sn,
    required this.symbol,
    required this.stockConfidence,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.vwap,
    required this.volume,
    required this.previousClose,
    required this.turnover,
    required this.transactions,
    required this.difference,
    required this.range,
    required this.differencePercentage,
    required this.rangePercentage,
    required this.vwapPercentage,
    required this.oneTwentyDays,
    required this.oneEightyDays,
    required this.fiftyTwoWeeksHigh,
    required this.fiftyTwoWeeksLow,
  });

  Map<String, dynamic> toMap() {
    return {
      'sn': sn,
      'symbol': symbol,
      'stockConfidence': stockConfidence,
      'open': open,
      'high': high,
      'low': low,
      'close': close,
      'vwap': vwap,
      'volume': volume,
      'previousClose': previousClose,
      'turnover': turnover,
      'transactions': transactions,
      'difference': difference,
      'range': range,
      'differencePercentage': differencePercentage,
      'rangePercentage': rangePercentage,
      'vwapPercentage': vwapPercentage,
      'oneTwentyDays': oneTwentyDays,
      'oneEightyDays': oneEightyDays,
      'fiftyTwoWeeksHigh': fiftyTwoWeeksHigh,
      'fiftyTwoWeeksLow': fiftyTwoWeeksLow,
    };
  }
}
