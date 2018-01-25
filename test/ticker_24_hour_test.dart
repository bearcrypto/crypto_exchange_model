import 'package:crypto_exchange_model/src/candle_stick.dart';
import 'package:crypto_exchange_model/src/exchange_data.dart';
import 'package:crypto_exchange_model/src/ticker_24_hour.dart';
import 'package:test/test.dart';


void main(){
  testTicker24HourConstructor();
  testTicker24HourToMap();
}


void testTicker24HourConstructor(){
  test("Ticker24Hour - Constructor", () {
    CoinTradingPair tradingPair = new CoinTradingPair("btc", "usd", "test_exchange");
    DateTime timestamp = new DateTime(2018);
    double volume24Hour = 1.0;
    double openPrice24Hour = 2.0;
    double highPrice24Hour = 3.0;
    double lowPrice24Hour = 4.0;
    double currentPrice = 5.0;


    Ticker24Hour ticker24hour = new Ticker24Hour(tradingPair, timestamp,
        volume24Hour, openPrice24Hour, highPrice24Hour, lowPrice24Hour,
        currentPrice
    );

    expect(ticker24hour.tradingPair, equals(tradingPair));
    expect(ticker24hour.timestamp, equals(timestamp));
    expect(ticker24hour.volume24Hour, equals(volume24Hour));
    expect(ticker24hour.openPrice24Hour, equals(openPrice24Hour));
    expect(ticker24hour.highPrice24Hour, equals(highPrice24Hour));
    expect(ticker24hour.lowPrice24Hour, equals(lowPrice24Hour));
    expect(ticker24hour.currentPrice, equals(currentPrice));


  });
}

void testTicker24HourToMap(){
  test("Ticker24Hour - toMap()", () {
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