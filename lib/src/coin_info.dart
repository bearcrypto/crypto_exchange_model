part of crypto_exchange_model;

class CoinInfo {
  String name;
  String symbol;
  String algorithm;
  String proofType;
  int sortOrder;
  String imageUrl;
  String id;

  CoinInfo(this.name, this.symbol, this.algorithm, this.proofType, this.sortOrder,
      this.imageUrl, this.id);

  CoinInfo.nameAndSymbol(this.name, this.symbol);

  CoinInfo.nameOnly(this.name);

  CoinInfo.fromMap(Map objectMap) {
    if(objectMap["name"] != null) this.name = objectMap["name"];
    if(objectMap["symbol"] != null) this.symbol = objectMap["symbol"];
    if(objectMap["algorithm"] != null) this.algorithm = objectMap["algorithm"];
    if(objectMap["proofType"] != null) this.proofType = objectMap["proofType"];
    if(objectMap["sortOrder"] != null) this.sortOrder = objectMap["sortOrder"];
    if(objectMap["imageUrl"] != null) this.imageUrl = objectMap["imageUrl"];
    if(objectMap["id"] != null) this.id = objectMap["id"];
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
    return objectMap;
  }

}