import 'package:crypto_exchange_data/src/exchange_data.dart';

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
}