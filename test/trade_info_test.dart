import 'package:crypto_exchange_model/crypto_exchange_model.dart';
import 'package:test/test.dart';


void main(){
  testTradeInfoConstructor();
  testTradeInfoToMap();
}


void testTradeInfoConstructor(){
  test("TradeInfo - Constructor", () {
    CoinTradingPair tradingPair = new CoinTradingPair("btc", "usd", "test_exchange");
    DateTime timestamp = new DateTime(2018);
    double amountTraded = 1.0;
    double amountPaid = 2.0;
    int flag = TradeInfo.BUY_FLAG;

    TradeInfo tradeInfo = new TradeInfo(tradingPair, timestamp, amountTraded,
        amountPaid, flag);

    expect(tradeInfo.tradingPair, equals(tradingPair));
    expect(tradeInfo.timestamp, equals(timestamp));
    expect(tradeInfo.amountTraded, equals(amountTraded));
    expect(tradeInfo.amountPaid, equals(amountPaid));
  });
}

void testTradeInfoToMap(){
  test("TradeInfo - toMap()", () {
    TradeInfo tradeInfo = new TradeInfo(new CoinTradingPair("btc", "usd", "test_exchange"),
        new DateTime(2018), 1.0,
        2.0, TradeInfo.BUY_FLAG);

    Map tradeInfoMap = tradeInfo.toMap();
    expect(tradeInfoMap.length, 7);
    expect(tradeInfoMap["timestamp"], equals(tradeInfo.timestamp.millisecondsSinceEpoch));
    expect(tradeInfoMap["baseCoinSymbol"], equals(tradeInfo.tradingPair.baseCoinSymbol));
    expect(tradeInfoMap["quoteCoinSymbol"], equals(tradeInfo.tradingPair.quoteCoinSymbol));
    expect(tradeInfoMap["exchangeName"], equals(tradeInfo.tradingPair.exchangeName));
    expect(tradeInfoMap["amountTraded"], equals(tradeInfo.amountTraded));
    expect(tradeInfoMap["amountPaid"], equals(tradeInfo.amountPaid));
    expect(tradeInfoMap["flag"], equals(tradeInfo.flag));

  });
}