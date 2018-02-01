part of crypto_exchange_model;

/// Models a crypto currency exchange.
///
class Exchange {
  /// The name of the crypto currency exchange.
  String name;
  /// List of coin pairings trading on the exchange.
  List<CoinPair> coinPairs;

  Exchange(this.name, this.coinPairs);
}

