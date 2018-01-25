import 'package:crypto_exchange_model/src/exchange_data.dart';

/// Represents a
/// [candle stick](https://www.investopedia.com/articles/technical/02/121702.asp)
/// of data.
class CandleStick extends ExchangeData {

  /// The date and time which the [CandleStick]'s data starts.
  final DateTime openTime;

  /// The amount of time this [CandleStick] covers.
  final Duration duration;

  /// The price of the [tradingPair.baseCoinSymbol] at [openTime].
  final double openPrice;

  /// the price of the [tradingPair.baseCoinSymbol] at the end of the [duration].
  final double closePrice;

  /// the highest price the [tradingPair.baseCoinSymbol] was traded from the
  /// [openTime] until the end of the [duration].
  final double highPrice;

  /// the lowest price the [tradingPair.baseCoinSymbol] was traded from the
  /// [openTime] until the end of the [duration].
  final double lowPrice;

  /// the amount of the [tradingPair.baseCoinSymbol] that was traded from the
  /// [openTime] until the end of the [duration].
  final double volume;

  CandleStick(CoinTradingPair tradingPair, DateTime timestamp, this.openTime,
      this.duration, this.openPrice, this.closePrice, this.highPrice,
      this.lowPrice, this.volume) : super(tradingPair, timestamp);

  @override
  Map toMap(){
    Map objectMap = {};
    objectMap["openTime"] = this.openTime.millisecondsSinceEpoch;
    objectMap["duration"] = this.duration.inMilliseconds;
    objectMap["openPrice"] = this.openPrice;
    objectMap["closePrice"] = this.closePrice;
    objectMap["highPrice"] = this.highPrice;
    objectMap["lowPrice"] = this.lowPrice;
    objectMap["volume"] = this.volume;
    objectMap.addAll(super.toMap());
    return objectMap;
  }
}
