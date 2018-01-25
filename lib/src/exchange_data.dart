/// An abstract class which acts as the base template for all data obtained from
/// the exchanges.
///
/// Class attributes [tradingPair] and [timestamp] can be used to uniquely
/// identify the data from the exchange. Any exchange data that has the same
/// [tradingPair] and [timestamp] will be considered the same and thus not
/// unique.
abstract class ExchangeData {

  /// Identifies what exchange the data came from and to what [CoinTradingPair]
  /// it relates.
  final CoinTradingPair tradingPair;

  /// Indicates the date and time this information was relevant.
  final DateTime timestamp;

  ExchangeData(this.tradingPair, this.timestamp);

  Map toMap(){
    Map objectMap = {};
    objectMap["timestamp"] = this.timestamp.millisecondsSinceEpoch;
    objectMap.addAll(this.tradingPair.toMap());
    return objectMap;
  }
}

/// Models the necessary information for identifying what coin pairing and
/// exchange a piece of [ExchangeData] relates to.
class CoinTradingPair {

  /// The main coin that is being dealt with
  ///
  /// In the coin pairing LTC/BTC, LTC would be the base coin, its the coin that
  /// we're working with (trading, buying, describing, etc.).
  String baseCoinSymbol;

  /// The coin the [baseCoinSymbol]'s value is based on.
  ///
  /// In the coin pairing LTC/BTC, BTC would be the quote coin. Its the currency
  /// used to buy/sell or describe the value of the [baseCoinSymbol].
  String quoteCoinSymbol;

  /// The name of the exchange the [baseCoinSymbol] and [quoteCoinSymbol] are
  /// being traded on
 String exchangeName;

  CoinTradingPair(String baseCoinSymbol, String quoteCoinSymbol, String exchangeName){
    this.baseCoinSymbol = baseCoinSymbol.toLowerCase();
    this.quoteCoinSymbol = quoteCoinSymbol.toLowerCase();
    this.exchangeName = exchangeName.toLowerCase();
  }

  Map toMap(){
    Map objectMap = {};
    objectMap["baseCoinSymbol"] = this.baseCoinSymbol;
    objectMap["quoteCoinSymbol"] = this.quoteCoinSymbol;
    objectMap["exchangeName"] = this.exchangeName;
    return objectMap;
  }
}
