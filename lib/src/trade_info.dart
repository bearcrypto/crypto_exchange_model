part of crypto_exchange_model;

/// Store info about a trade that took place on an exchange.
class TradeInfo extends ExchangeData{

  /// The amount of the [tradingPair.baseCoinSymbol] that got traded.
  double amountTraded;

  /// the amount of the [tradingPair.quoteCoinSymbol] that was paid for
  /// the [amountTraded].
  double amountPaid;

  TradeInfo.noFields(CoinTradingPair tradingPair, DateTime timestamp )
      : super(tradingPair, timestamp);

  TradeInfo(CoinTradingPair tradingPair, DateTime timestamp, this.amountTraded,
      this.amountPaid) : super(tradingPair, timestamp);

  TradeInfo.fromMap(Map objectMap) : super.fromMap(objectMap){
    if(objectMap["amountTraded"] != null) this.amountTraded = objectMap["amountTraded"];
    if(objectMap["amountPaid"] != null) this.amountPaid = objectMap["amountPaid"];
  }

  @override
  Map toMap(){
    Map objectMap = {};
    if(this.amountTraded != null) objectMap["amountTraded"] = this.amountTraded;
    if(this.amountPaid != null) objectMap["amountPaid"] = this.amountPaid;
    objectMap.addAll(super.toMap());
    return objectMap;
  }
}