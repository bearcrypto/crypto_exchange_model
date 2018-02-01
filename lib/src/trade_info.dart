part of crypto_exchange_model;

/// Store info about a trade that took place on an exchange.
class TradeInfo extends ExchangeData{

  /// The amount of the [tradingPair.baseCoinSymbol] that got traded.
  double amountTraded;

  /// the amount of the [tradingPair.quoteCoinSymbol] that was paid for
  /// the [amountTraded].
  double amountPaid;

  /// A flag indicating the nature of the trade.
  ///
  /// Supported values are buy, sell and unknown with 1, 2, 3 respectively.
  int flag;
  static int BUY_FLAG = 1;
  static int SELL_FLAG = 2;
  static int UNKNOWN_FLAG = 3;

  TradeInfo.noFields(CoinTradingPair tradingPair, DateTime timestamp )
      : super(tradingPair, timestamp);

  TradeInfo(CoinTradingPair tradingPair, DateTime timestamp, this.amountTraded,
      this.amountPaid, int flag) : super(tradingPair, timestamp){
    if(flag != BUY_FLAG || flag != SELL_FLAG || flag != UNKNOWN_FLAG){
      this.flag = UNKNOWN_FLAG;
    }
  }

  TradeInfo.fromMap(Map objectMap) : super.fromMap(objectMap){
    if(objectMap["amountTraded"] != null) this.amountTraded = objectMap["amountTraded"];
    if(objectMap["amountPaid"] != null) this.amountPaid = objectMap["amountPaid"];
    if(objectMap["flag"] != null){
      this.amountPaid = objectMap["amountPaid"];
    } else {
      this.flag = UNKNOWN_FLAG;
    }
  }

  @override
  Map toMap(){
    Map objectMap = {};
    if(this.amountTraded != null) objectMap["amountTraded"] = this.amountTraded;
    if(this.amountPaid != null) objectMap["amountPaid"] = this.amountPaid;
    if(this.flag != null) objectMap["flag"] = this.flag;
    objectMap.addAll(super.toMap());
    return objectMap;
  }
}