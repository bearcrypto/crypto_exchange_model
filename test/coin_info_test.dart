import 'package:crypto_exchange_model/crypto_exchange_model.dart';
import 'package:test/test.dart';


void main(){
  testCoinInfoConstructor();
  testCoinInfoNameSymbolConstructor();
  testCoinInfoToMap();
}

void testCoinInfoConstructor(){
  test("CoinInfo - Constructor", () {
    String name = "Bitcoin";
    String symbol = "BTC";
    String algorithm = "SHA256";
    String proofType = "Work";
    int sortOrder = 1;
    String imageUrl = "/btc.png";

    CoinInfo coinInfo = new CoinInfo(name, symbol, algorithm, proofType, sortOrder, imageUrl);

    expect(coinInfo.name, equals(name));
    expect(coinInfo.symbol, equals(symbol));
    expect(coinInfo.algorithm, equals(algorithm));
    expect(coinInfo.proofType, equals(proofType));
    expect(coinInfo.sortOrder, equals(sortOrder));
    expect(coinInfo.imageUrl, equals(imageUrl));
  });
}

void testCoinInfoNameSymbolConstructor(){
  test("CoinInfo.nameAndSymbol - Constructor", () {
    String name = "Bitcoin";
    String symbol = "BTC";

    CoinInfo coinInfo = new CoinInfo.nameAndSymbol(name, symbol);

    expect(coinInfo.name, equals(name));
    expect(coinInfo.symbol, equals(symbol));
  });
}

void testCoinInfoToMap(){
  test("CoinInfo - toMap()", () {
    CoinInfo coinInfo = new CoinInfo("Bitcoin", "BTC", "SHA256", "Work", 1, "/btc.png");

    Map coinInfoMap = coinInfo.toMap();
    expect(coinInfoMap.length, 10);
    expect(coinInfoMap["timestamp"], equals(coinInfo.timestamp.millisecondsSinceEpoch));
    expect(coinInfoMap["baseCoinSymbol"], equals(coinInfo.tradingPair.baseCoinSymbol));
    expect(coinInfoMap["quoteCoinSymbol"], equals(coinInfo.tradingPair.quoteCoinSymbol));
    expect(coinInfoMap["exchangeName"], equals(coinInfo.tradingPair.exchangeName));
    expect(coinInfoMap["name"], equals(coinInfo.name));
    expect(coinInfoMap["symbol"], equals(coinInfo.symbol));
    expect(coinInfoMap["algorithm"], equals(coinInfo.algorithm));
    expect(coinInfoMap["proofType"], equals(coinInfo.proofType));
    expect(coinInfoMap["sortOrder"], equals(coinInfo.sortOrder));
    expect(coinInfoMap["imageUrl"], equals(coinInfo.imageUrl));
  });
}