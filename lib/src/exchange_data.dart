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
  CoinTradingPair tradingPair;

  /// Indicates the date and time this information was relevant.
  DateTime timestamp;

  ExchangeData(this.tradingPair, this.timestamp);
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

  CoinTradingPair(this.baseCoinSymbol, this.quoteCoinSymbol, this.exchangeName);
}