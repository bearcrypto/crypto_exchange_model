part of crypto_exchange_model;

class CoinInfo extends ExchangeData {
  String name;
  String symbol;
  String algorithm;
  String proofType;
  int sortOrder;
  String imageUrl;

  CoinInfo(this.name, String symbol, this.algorithm, this.proofType, this.sortOrder,
      this.imageUrl) : super(new CoinTradingPair(symbol, "NA", "NA"), new DateTime.now()){
    this.symbol = symbol;
  }

  CoinInfo.nameAndSymbol(this.name, String symbol)
      : super(new CoinTradingPair(symbol, "NA", "NA"), new DateTime.now()){
    this.symbol = symbol;
  }

  CoinInfo.fromMap(Map objectMap) : super.fromMap(objectMap) {
    if(objectMap["name"] != null) this.name = objectMap["name"];
    if(objectMap["symbol"] != null) this.symbol = objectMap["symbol"];
    if(objectMap["algorithm"] != null) this.algorithm = objectMap["algorithm"];
    if(objectMap["proofType"] != null) this.proofType = objectMap["proofType"];
    if(objectMap["sortOrder"] != null) this.sortOrder = objectMap["sortOrder"];
    if(objectMap["imageUrl"] != null) this.imageUrl = objectMap["imageUrl"];
  }


  @override
  Map toMap(){
    Map objectMap = {};
    if(this.name != null) objectMap["name"] = this.name;
    if(this.symbol != null) objectMap["symbol"] = this.symbol;
    if(this.algorithm != null) objectMap["algorithm"] = this.algorithm;
    if(this.proofType != null) objectMap["proofType"] = this.proofType;
    if(this.sortOrder != null) objectMap["sortOrder"] = this.sortOrder;
    if(this.imageUrl != null) objectMap["imageUrl"] = this.imageUrl;
    objectMap.addAll(super.toMap());
    return objectMap;
  }

}