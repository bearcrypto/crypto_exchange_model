import 'package:crypto_exchange_model/crypto_exchange_model.dart';
import "package:test/test.dart";

void main() {
  testExchangeDataConstructor();
  testExchangeDataToMap();

  testCoinTradingPairConstructor();
  testCoinTradingPairToMap();

  testExchangeDataContainer();
}

void testExchangeDataConstructor(){
  test("ExchangeData - Constructor", () {
    CoinTradingPair tradingPair = new CoinTradingPair(
        "btc", "ltc", "test_exchange");
    DateTime timestamp = new DateTime(2018);
    ExchangeDataTest exchangeDataTest = new ExchangeDataTest(
        tradingPair, timestamp);
    expect(exchangeDataTest.tradingPair, equals(tradingPair));
    expect(exchangeDataTest.timestamp, equals(timestamp));
  });
}

void testExchangeDataToMap(){
  test("ExchangeData - toMap()", () {
    ExchangeDataTest exchangeDataTest = new ExchangeDataTest(
        new CoinTradingPair("btc", "ltc", "test_exchange"),
        new DateTime(2018)
    );
    Map exchangeDataMap = exchangeDataTest.toMap();
    expect(exchangeDataMap.length, 4);
    expect(exchangeDataMap["timestamp"], equals(exchangeDataTest.timestamp.millisecondsSinceEpoch));
    expect(exchangeDataMap["baseCoinSymbol"], equals(exchangeDataTest.tradingPair.baseCoinSymbol));
    expect(exchangeDataMap["quoteCoinSymbol"], equals(exchangeDataTest.tradingPair.quoteCoinSymbol));
    expect(exchangeDataMap["exchangeName"], equals(exchangeDataTest.tradingPair.exchangeName));
  });
}

void testCoinTradingPairConstructor(){
  test("CoinTradingPair - Constructor", () {
    String baseCoinSymbol = "btc";
    String quoteCoinSymbol = "usd";
    String exchangeName = "test_exchange";

    CoinTradingPair coinTradingPair = new CoinTradingPair(
        baseCoinSymbol, quoteCoinSymbol, exchangeName);

    expect(coinTradingPair.baseCoinSymbol, baseCoinSymbol);
    expect(coinTradingPair.quoteCoinSymbol, quoteCoinSymbol);
    expect(coinTradingPair.exchangeName, exchangeName);
  });
}

void testCoinTradingPairToMap(){
  test("CoinTradingPair - toMap()", () {
    CoinTradingPair coinTradingPair = new CoinTradingPair("btc", "usd", "test_exchange");
    Map coinTradingPairMap = coinTradingPair.toMap();
    expect(coinTradingPairMap.length, 3);
    expect(coinTradingPairMap["baseCoinSymbol"], equals(coinTradingPair.baseCoinSymbol));
    expect(coinTradingPairMap["quoteCoinSymbol"], equals(coinTradingPair.quoteCoinSymbol));
    expect(coinTradingPairMap["exchangeName"], equals(coinTradingPair.exchangeName));
  });
}

class ExchangeDataTest extends ExchangeData {
  ExchangeDataTest(CoinTradingPair tradingPair, DateTime timestamp) : super(tradingPair, timestamp);
}