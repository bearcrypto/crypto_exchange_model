part of crypto_exchange_model;
/// Represents a
/// [candle stick](https://www.investopedia.com/articles/technical/02/121702.asp)
/// of data.
class CandleStick extends ExchangeData {

  /// The date and time which the [CandleStick]'s data starts.
  DateTime openTime;

  /// The amount of time this [CandleStick] covers.
  Duration duration;

  /// The price of the [tradingPair.baseCoinSymbol] at [openTime].
  double openPrice;

  /// the price of the [tradingPair.baseCoinSymbol] at the end of the [duration].
  double closePrice;

  /// the highest price the [tradingPair.baseCoinSymbol] was traded from the
  /// [openTime] until the end of the [duration].
  double highPrice;

  /// the lowest price the [tradingPair.baseCoinSymbol] was traded from the
  /// [openTime] until the end of the [duration].
  double lowPrice;

  /// the amount of the [tradingPair.baseCoinSymbol] that was traded from the
  /// [openTime] until the end of the [duration].
  double volume;

  CandleStick(CoinTradingPair tradingPair, DateTime timestamp, this.openTime,
      this.duration, this.openPrice, this.closePrice, this.highPrice,
      this.lowPrice, this.volume) : super(tradingPair, timestamp);

  CandleStick.fromMap(Map objectMap) : super.fromMap(objectMap) {
    if(objectMap["openTime"] != null) this.openTime = new DateTime.fromMillisecondsSinceEpoch(objectMap["openTime"]);
    if(objectMap["duration"] != null) this.duration = new Duration(milliseconds: objectMap["duration"]);
    if(objectMap["openPrice"] != null) this.openPrice = objectMap["openPrice"];
    if(objectMap["closePrice"] != null) this.closePrice = objectMap["closePrice"];
    if(objectMap["highPrice"] != null) this.highPrice = objectMap["highPrice"];
    if(objectMap["lowPrice"] != null) this.lowPrice = objectMap["lowPrice"];
    if(objectMap["volume"] != null) this.volume = objectMap["volume"];
  }

  void updateFromMap(Map objectMap){

  }

  static List<CandleStick> getMatchingCandleSticks(List<CandleStick> listOfCandleSticks,
      Duration duration, CoinTradingPair coinTradingPair){
    List<CandleStick> result = [];
    listOfCandleSticks.forEach((candleStick){
      if(candleStick.duration.inMilliseconds == duration.inMilliseconds){
        result.add(candleStick);
      }
    });
    return result;
  }

  static void saveCandleStickInList(CandleStick candleStick, List<CandleStick> listOfCandleSticks){
    List<CandleStick> possibleMatches = getMatchingCandleSticks(listOfCandleSticks, candleStick.duration, candleStick.tradingPair);
    bool updatedExistingCandleStick = false;
    possibleMatches.forEach((possibleMatch){
      if(possibleMatch.openTime == candleStick.openTime){
        updatedExistingCandleStick = true;
        possibleMatch.update(candleStick);
      }
    });
    if(!updatedExistingCandleStick){
      listOfCandleSticks.add(candleStick);
    }
  }

  @override
  Map toMap(){
    Map objectMap = {};
    if(this.openTime != null) objectMap["openTime"] = this.openTime.millisecondsSinceEpoch;
    if(this.duration != null) objectMap["duration"] = this.duration.inMilliseconds;
    if(this.openPrice != null) objectMap["openPrice"] = this.openPrice;
    if(this.closePrice != null) objectMap["closePrice"] = this.closePrice;
    if(this.highPrice != null) objectMap["highPrice"] = this.highPrice;
    if(this.lowPrice != null) objectMap["lowPrice"] = this.lowPrice;
    if(this.volume != null) objectMap["volume"] = this.volume;
    objectMap.addAll(super.toMap());
    return objectMap;
  }
}
