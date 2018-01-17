import 'package:crypto_exchange_data/src/exchange_data.dart';

/// Store info about a trade that took place on an exchange.
class TradeInfo extends ExchangeData{

  /// The amount of the [tradingPair.baseCoinSymbol] that got traded.
  double amountTraded;

  /// the amount of the [tradingPair.quoteCoinSymbol] that was paid for
  /// the [amountTraded].
  double amountPaid;

  TradeInfo(CoinTradingPair tradingPair, DateTime timestamp, this.amountTraded,
      this.amountPaid) : super(tradingPair, timestamp);
}