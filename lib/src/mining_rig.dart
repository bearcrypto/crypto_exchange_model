part of crypto_exchange_model;
/// Models a rig used for mining crypto currencies
///
class MiningRig {
  String id;
  String name;
  String imageUrl;
  String websiteUrl;
  String algorithm;
  int hashesPerSecond;
  double cost;
  String currency;
  int powerConsumption;
  CoinInfo currencyAvailable;
  String equipmentType;

  MiningRig(this.id, this.name, this.imageUrl, this.websiteUrl, this.algorithm,
      this.hashesPerSecond, this.cost, this.currency, this.powerConsumption,
      this.currencyAvailable, this.equipmentType);
}