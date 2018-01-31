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


  @override
  Map toMap(){
    Map objectMap = {};
    objectMap["name"] = this.name;
    objectMap["symbol"] = this.symbol;
    objectMap["algorithm"] = this.algorithm;
    objectMap["proofType"] = this.proofType;
    objectMap["sortOrder"] = this.sortOrder;
    objectMap["imageUrl"] = this.imageUrl;
    objectMap.addAll(super.toMap());
    return objectMap;
  }

}