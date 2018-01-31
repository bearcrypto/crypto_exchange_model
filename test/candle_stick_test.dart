import 'package:crypto_exchange_model/crypto_exchange_model.dart';
import 'package:test/test.dart';


void main(){
  testCandleStickConstructor();
  testCandleStickToMap();
}


void testCandleStickConstructor(){
  test("CandleStick - Constructor", () {
    CoinTradingPair tradingPair = new CoinTradingPair("btc", "usd", "test_exchange");
    DateTime timestamp = new DateTime(2018);
    DateTime openTime = new DateTime(2017);
    Duration duration = new Duration(seconds: 1);
    double openPrice = 1.0;
    double closePrice = 2.0;
    double highPrice = 3.0;
    double lowPrice = 4.0;
    double volume = 5.0;

    CandleStick candleStick = new CandleStick(tradingPair, timestamp, openTime,
        duration, openPrice, closePrice, highPrice, lowPrice, volume);

    expect(candleStick.tradingPair, equals(tradingPair));
    expect(candleStick.timestamp, equals(timestamp));
    expect(candleStick.openTime, equals(openTime));
    expect(candleStick.duration, equals(duration));
    expect(candleStick.openPrice, equals(openPrice));
    expect(candleStick.closePrice, equals(closePrice));
    expect(candleStick.highPrice, equals(highPrice));
    expect(candleStick.lowPrice, equals(lowPrice));
    expect(candleStick.volume, equals(volume));
  });
}

void testCandleStickToMap(){
  test("CandleStick - toMap()", () {
    CandleStick candleStick = new CandleStick(
        new CoinTradingPair("btc", "usd", "test_exchange"),
        new DateTime(2018), new DateTime(2017), new Duration(seconds: 1), 1.0,
        2.0, 3.0, 4.0, 5.0);

    Map candleStickMap = candleStick.toMap();
    expect(candleStickMap.length, 11);
    expect(candleStickMap["timestamp"], equals(candleStick.timestamp.millisecondsSinceEpoch));
    expect(candleStickMap["baseCoinSymbol"], equals(candleStick.tradingPair.baseCoinSymbol));
    expect(candleStickMap["quoteCoinSymbol"], equals(candleStick.tradingPair.quoteCoinSymbol));
    expect(candleStickMap["exchangeName"], equals(candleStick.tradingPair.exchangeName));
    expect(candleStickMap["openTime"], equals(candleStick.openTime.millisecondsSinceEpoch));
    expect(candleStickMap["duration"], equals(candleStick.duration.inMilliseconds));
    expect(candleStickMap["openPrice"], equals(candleStick.openPrice));
    expect(candleStickMap["closePrice"], equals(candleStick.closePrice));
    expect(candleStickMap["highPrice"], equals(candleStick.highPrice));
    expect(candleStickMap["lowPrice"], equals(candleStick.lowPrice));
    expect(candleStickMap["volume"], equals(candleStick.volume));
  });
}