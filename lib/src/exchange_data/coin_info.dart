part of crypto_exchange_model;

class CoinInfo extends ExchangeData {
  String name;
  String symbol;
  String algorithm;
  String proofType;
  int sortOrder;
  String imageUrl;
  String id;
  String description;
  String url;
  DateTime startDate;
  int totalCoinSupply;
  double totalCoinsMined;
  String twitterHandle;

  CoinInfo(this.name, String symbol, this.algorithm, this.proofType, this.sortOrder,
      this.imageUrl, this.id) : super(new CoinTradingPair(symbol, "NA", "NA"), new DateTime.now());

  CoinInfo.extended(this.name, String symbol, this.algorithm, this.proofType, this.sortOrder,
      this.imageUrl, this.id, this.description, this.url, this.startDate, this.totalCoinSupply,
      this.totalCoinsMined, this.twitterHandle) : super(new CoinTradingPair(symbol, "NA", "NA"), new DateTime.now());

  CoinInfo.nameAndSymbol(this.name, String symbol) : super(new CoinTradingPair(symbol, "NA", "NA"), new DateTime.now());

  CoinInfo.nameOnly(this.name) : super(new CoinTradingPair("NA", "NA", "NA"), new DateTime.now());

  CoinInfo.fromMap(Map objectMap) : super.fromMap(objectMap) {
    if(objectMap["name"] != null) this.name = objectMap["name"];
    if(objectMap["symbol"] != null) this.symbol = objectMap["symbol"];
    if(objectMap["algorithm"] != null) this.algorithm = objectMap["algorithm"];
    if(objectMap["proofType"] != null) this.proofType = objectMap["proofType"];
    if(objectMap["sortOrder"] != null) this.sortOrder = objectMap["sortOrder"];
    if(objectMap["imageUrl"] != null) this.imageUrl = objectMap["imageUrl"];
    if(objectMap["id"] != null) this.id = objectMap["id"];
    if(objectMap["description"] != null) this.description = objectMap["description"];
    if(objectMap["url"] != null) this.url = objectMap["url"];
    if(objectMap["startDate"] != null) this.startDate = objectMap["startDate"];
    if(objectMap["totalCoinSupply"] != null) this.totalCoinSupply = objectMap["totalCoinSupply"];
    if(objectMap["totalCoinsMined"] != null) this.totalCoinsMined = objectMap["totalCoinsMined"];
    if(objectMap["twitterHandle"] != null) this.twitterHandle = objectMap["twitterHandle"];
  }

  static List<CoinTradingPair> getAllCoinTradingPairsForQuoteCoin(String quoteCoinSymbol, List<Exchange> exchanges, [String exchangeName]){
    Map<String, bool> coinTradingPairsMap = {};
    exchanges.forEach((Exchange exchange){
      exchange.coinPairs.forEach((coinPair){
        if(coinPair.quoteCoinSymbol == quoteCoinSymbol){
          coinTradingPairsMap[coinPair.baseCoinSymbol] = true;
        }
      });
    });
    List<CoinTradingPair> coinTradingPairs = new List<CoinTradingPair>();
    coinTradingPairsMap.forEach((baseCoinSymbol, boolValue){
      coinTradingPairs.add(new CoinTradingPair(baseCoinSymbol, quoteCoinSymbol, exchangeName != null ? exchangeName : "NA"));
    });
    return coinTradingPairs;
  }

  Map toMap(){
    Map objectMap = {};
    if(this.name != null) objectMap["name"] = this.name;
    if(this.symbol != null) objectMap["symbol"] = this.symbol;
    if(this.algorithm != null) objectMap["algorithm"] = this.algorithm;
    if(this.proofType != null) objectMap["proofType"] = this.proofType;
    if(this.sortOrder != null) objectMap["sortOrder"] = this.sortOrder;
    if(this.imageUrl != null) objectMap["imageUrl"] = this.imageUrl;
    if(this.id != null) objectMap["id"] = this.id;
    if(this.description != null) objectMap["description"] = this.description;
    if(this.url != null) objectMap["url"] = this.url;
    if(this.startDate != null) objectMap["startDate"] = this.startDate;
    if(this.totalCoinSupply != null) objectMap["totalCoinsSupply"] = this.totalCoinSupply;
    if(this.totalCoinsMined != null) objectMap["totalCoinsMined"] = this.totalCoinsMined;
    if(this.twitterHandle != null) objectMap["twitterHandle"] = this.twitterHandle;
    objectMap.addAll(super.toMap());
    return objectMap;
  }

}