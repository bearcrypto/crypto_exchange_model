part of crypto_exchange_model;

/// Models a crypto currency exchange.
///
class Exchange {
  /// The name of the crypto currency exchange.
  String name;
  /// List of coin pairings trading on the exchange.
  List<CoinPair> coinPairs;

  /// Unique identifier for the exchange.
  String id;

  Exchange(this.name, this.coinPairs, this.id);

  Exchange.fromMap(Map objectMap){
    if(objectMap["name"] != null) this.name = objectMap["name"];
    if(objectMap["id"] != null) this.id = objectMap["id"];
    if(objectMap["coinPairs"] != null && objectMap["coinPairs"] is List){
      this.coinPairs = new List<CoinPair>();
      objectMap["coinPairs"].forEach((coinPairMap){
        coinPairs.add(new CoinPair.fromMap(coinPairMap));
      });
    }
  }

  Map toMap(){
    Map objectMap = {};
    if(this.name != null) objectMap["name"] = this.name;
    if(this.id != null) objectMap["id"] = this.id;
    if(this.coinPairs != null){
      objectMap["coinPairs"] = new List<Map>();
      this.coinPairs.forEach((coinPair){
        objectMap["coinPairs"].add(coinPair.toMap());
      });
    }
    return objectMap;
  }
}

