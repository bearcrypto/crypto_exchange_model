part of crypto_exchange_model;

class CoinInfo extends ExchangeData {
  String name;
  String symbol;
  String algorithm;
  String proofType;
  String sortOrder;
  String imageUrl;

  CoinInfo(this.name, String symbol, this.algorithm, this.proofType, this.sortOrder,
      this.imageUrl) : super(new CoinTradingPair(symbol, "NA", "NA"), new DateTime.now()){
    this.symbol = symbol;
  }

  CoinInfo.nameAndSymbol(this.name, String symbol)
      : super(new CoinTradingPair(symbol, "NA", "NA"), new DateTime.now()){
    this.symbol = symbol;
  }
}