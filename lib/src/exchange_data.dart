/// An abstract class which acts as the base template for all data obtained from
/// the exchanges.
///
/// Class attributes [tradingPair] and [timestamp] can be used to uniquely
/// identify the data from the exchange. Any exchange data that has the same
/// [tradingPair] and [timestamp] will be considered the same and thus not
/// unique.

import 'package:crypto_exchange_model/src/candle_stick.dart';

abstract class ExchangeData {

  /// Identifies what exchange the data came from and to what [CoinTradingPair]
  /// it relates.
  final CoinTradingPair tradingPair;

  /// Indicates the date and time this information was relevant.
  final DateTime timestamp;

  ExchangeData(this.tradingPair, this.timestamp);

  Map toMap(){
    Map objectMap = {};
    objectMap["timestamp"] = this.timestamp.millisecondsSinceEpoch;
    objectMap.addAll(this.tradingPair.toMap());
    return objectMap;
  }
}

/// Models the necessary information for identifying what coin pairing and
/// exchange a piece of [ExchangeData] relates to.
class CoinTradingPair {

  /// The main coin that is being dealt with
  ///
  /// In the coin pairing LTC/BTC, LTC would be the base coin, its the coin that
  /// we're working with (trading, buying, describing, etc.).
  String baseCoinSymbol;

  /// The coin the [baseCoinSymbol]'s value is based on.
  ///
  /// In the coin pairing LTC/BTC, BTC would be the quote coin. Its the currency
  /// used to buy/sell or describe the value of the [baseCoinSymbol].
  String quoteCoinSymbol;

  /// The name of the exchange the [baseCoinSymbol] and [quoteCoinSymbol] are
  /// being traded on
 String exchangeName;

  CoinTradingPair(String baseCoinSymbol, String quoteCoinSymbol, String exchangeName){
    this.baseCoinSymbol = baseCoinSymbol.toLowerCase();
    this.quoteCoinSymbol = quoteCoinSymbol.toLowerCase();
    this.exchangeName = exchangeName.toLowerCase();
  }

  Map toMap(){
    Map objectMap = {};
    objectMap["baseCoinSymbol"] = this.baseCoinSymbol;
    objectMap["quoteCoinSymbol"] = this.quoteCoinSymbol;
    objectMap["exchangeName"] = this.exchangeName;
    return objectMap;
  }
}

/// Acts as a container for storing information about [CoinTradingPair]s.
///
/// It's basically an interface for interacting with a hash map which is capable
/// of storing and easily updating data about various [CoinTradingPair]s
class ExchangeDataContainer {
  /// The base data structure of the [ExchangeDataContainer].
  ///
  Map _coinTradingPairMap = new Map();

  /// Adds (or updates) the exchange data for a specific [CoinTradingPair].
  /// This function will automatically place the exchange data in the appropriate
  /// location in the [_coinTradingPairMap];
  void addExchangeData(ExchangeData exchangeData){
    // Names intentionally shortened to increase code readability
    String b = exchangeData.tradingPair.baseCoinSymbol.toLowerCase();
    String q = exchangeData.tradingPair.quoteCoinSymbol.toLowerCase();
    String e = exchangeData.tradingPair.exchangeName.toLowerCase();
    String rt = exchangeData.runtimeType.toString().toLowerCase();
    if(this._coinTradingPairMap[b] == null) this._coinTradingPairMap[b] = {};
    if(this._coinTradingPairMap[b][q] == null) this._coinTradingPairMap[b][q] = {};
    if(this._coinTradingPairMap[b][q][e] == null) this._coinTradingPairMap[b][q][e] = {};
    if(exchangeData is CandleStick){
      int d = exchangeData.duration.inSeconds;
      int ot = exchangeData.openTime.millisecondsSinceEpoch;
      if(this._coinTradingPairMap[b][q][e][rt] == null) this._coinTradingPairMap[b][q][e][rt] = {};
      if(this._coinTradingPairMap[b][q][e][rt][d] == null) this._coinTradingPairMap[b][q][e][rt][d] = {};
      this._coinTradingPairMap[b][q][e][rt][d][ot] = exchangeData;
    } else {
      this._coinTradingPairMap[b][q][e][rt] = exchangeData;
    }
  }

  /// Helper method which makes it easier to add a list of [ExchangeData] as
  /// opposed to just one single [ExchangeData] at a time like in [addExchangeData].
  void addListOfExchangeData(List<ExchangeData> listOfExchangeData){
    listOfExchangeData.forEach((exchangeData){
      this.addExchangeData(exchangeData);
    });
  }

  /// Removes all of the [CandleStick] data from the [_coinTradingPairMap].
  ///
  /// Unlike other types of [ExchangeData], [CandleStick] data is more plentiful
  /// and therefore has the potential to take up more memory than other types of
  /// data.
  ///
  /// This method provides clients with a way to easily remove all of the
  /// [CandleStick] data that might have built up in the [_coinTradingPairMap], and
  /// clear out some memory.
  void removeCandleSticksForCoinTradingPair(CoinTradingPair coinTradingPair){
    CandleStick candleStick = new CandleStick(null, null, null, null, null, null, null, null, null);
    String b = coinTradingPair.baseCoinSymbol.toLowerCase();
    String q = coinTradingPair.quoteCoinSymbol.toLowerCase();
    String e = coinTradingPair.exchangeName.toLowerCase();
    String rt = candleStick.runtimeType.toString().toLowerCase();
    if(this._coinTradingPairMap[b] != null && this._coinTradingPairMap[b][q] != null
    && this._coinTradingPairMap[b][q][e] != null && this._coinTradingPairMap[b][q][e][rt] != null){
      this._coinTradingPairMap[b][q][e][rt] = null;
    }
  }

  /// Removes all of the informaiton stored about a specific [CoinTradingPair]
  /// from the [_coinTradingPairMap];
  void removeCoinTradingPair(CoinTradingPair coinTradingPair){
    String b = coinTradingPair.baseCoinSymbol.toLowerCase();
    String q = coinTradingPair.quoteCoinSymbol.toLowerCase();
    String e = coinTradingPair.exchangeName.toLowerCase();
    if(this._coinTradingPairMap[b] != null && this._coinTradingPairMap[b][q] != null
        && this._coinTradingPairMap[b][q][e] != null){
      this._coinTradingPairMap[b][q][e] = null;
    }
  }

  /// Completely clears out the [_coinTradingPairMap] and all of it's information.
  ///
  void clear(){
    this._coinTradingPairMap.clear();
  }
}