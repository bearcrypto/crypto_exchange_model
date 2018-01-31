part of crypto_exchange_model;

/// A snapshot of the [tradingPair]'s performance over the last 24 hours.
///
/// This is the main piece of information that will be used to determine the
/// overall coin pairings performance across exchanges. From this ticker
/// information we can derive a multitude of additional information.
class Ticker24Hour extends ExchangeData{

  /// The amount of the [tradingPair.baseCoinSymbol] that was traded in the
  /// past 24 hours.
  double volume24Hour;

  /// The amount of the [tradingPair.quoteCoinSymbol] that the
  /// [tradingPair.baseCoinSymbol] was selling for exactly 24 hours ago.
  double openPrice24Hour;

  /// The highest amount of the [tradingPair.quoteCoinSymbol] that the
  /// [tradingPair.baseCoinSymbol] was selling for in the past 24 hours.
  double highPrice24Hour;

  /// The lowest amount of the [tradingPair.quoteCoinSymbol] that the
  /// [tradingPair.baseCoinSymbol] was selling for in the past 24 hours.
  double lowPrice24Hour;
  
  /// The current price the coin pairing is trading at
  ///
  double currentPrice;

  /// Indicates what happened with the price since the last ticker.
  ///
  /// Valid values are one of [PRICEUP], [PRICEDOWN] or [PRICEUNCHANGED].
  int priceFlag;

  /// Indicates that the price went up.
  ///
  static final int PRICEUP = 1;
  /// Indicates that the price went down.
  ///
  static final int PRICEDOWN = 2;
  /// Indicates that the price is unchanged.
  ///
  static final int PRICEUNCHANGED = 4;

  Ticker24Hour.noFields(CoinTradingPair tradingPair, DateTime timestamp )
    : super(tradingPair, timestamp);

  Ticker24Hour(CoinTradingPair tradingPair, DateTime timestamp,
      this.volume24Hour, this.openPrice24Hour, this.highPrice24Hour,
      this.lowPrice24Hour, this.currentPrice, this.priceFlag) : super(tradingPair, timestamp);

  Ticker24Hour.fromMap(Map objectMap) : super.fromMap(objectMap){
    if(objectMap["volume24Hour"] != null) this.volume24Hour = objectMap["volume24Hour"];
    if(objectMap["openPrice24Hour"] != null) this.openPrice24Hour = objectMap["openPrice24Hour"];
    if(objectMap["highPrice24Hour"] != null) this.highPrice24Hour = objectMap["highPrice24Hour"];
    if(objectMap["lowPrice24Hour"] != null) this.lowPrice24Hour = objectMap["lowPrice24Hour"];
    if(objectMap["currentPrice"] != null) this.currentPrice = objectMap["currentPrice"];
  }

  @override
  Map toMap(){
    Map objectMap = {};
    if(this.volume24Hour != null) objectMap["volume24Hour"] = this.volume24Hour;
    if(this.openPrice24Hour != null) objectMap["openPrice24Hour"] = this.openPrice24Hour;
    if(this.highPrice24Hour != null) objectMap["highPrice24Hour"] = this.highPrice24Hour;
    if(this.lowPrice24Hour != null) objectMap["lowPrice24Hour"] = this.lowPrice24Hour;
    if(this.currentPrice != null) objectMap["currentPrice"] = this.currentPrice;
    objectMap.addAll(super.toMap());
    return objectMap;
  }
}
