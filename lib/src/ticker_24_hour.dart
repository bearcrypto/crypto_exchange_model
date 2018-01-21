import 'package:crypto_exchange_model/src/exchange_data.dart';

/// A snapshot of the [tradingPair]'s performance over the last 24 hours.
///
/// This is the main piece of information that will be used to determine the
/// overall coin pairings performance across exchanges. From this ticker
/// information we can derive a multitude of additional information.
class Ticker24Hour extends ExchangeData{

  /// The amount of the [tradingPair.baseCoinSymbol] that was traded in the
  /// past 24 hours.
  final double volume24Hour;

  /// The amount of the [tradingPair.quoteCoinSymbol] that the
  /// [tradingPair.baseCoinSymbol] was selling for exactly 24 hours ago.
  final double openPrice24Hour;

  /// The highest amount of the [tradingPair.quoteCoinSymbol] that the
  /// [tradingPair.baseCoinSymbol] was selling for in the past 24 hours.
  final double highPrice24Hour;

  /// The lowest amount of the [tradingPair.quoteCoinSymbol] that the
  /// [tradingPair.baseCoinSymbol] was selling for in the past 24 hours.
  final double lowPrice24Hour;


  Ticker24Hour(CoinTradingPair tradingPair, DateTime timestamp,
      this.volume24Hour, this.openPrice24Hour, this.highPrice24Hour,
      this.lowPrice24Hour) : super(tradingPair, timestamp);
}