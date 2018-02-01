import 'package:crypto_exchange_model/crypto_exchange_model.dart';

/// Models a crypto currency exchange.
///
class Exchange {
  /// The name of the crypto currency exchange.
  String name;
  /// List of coin pairings trading on the exchange.
  List<CoinPair> coinPairs;

  Exchange(this.name, this.coinPairs);
}

