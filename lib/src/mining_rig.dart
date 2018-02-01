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

  MiningRig.fromMap(Map objectMap){
    if(objectMap["id"] != null) this.id = objectMap["id"];
    if(objectMap["name"] != null) this.name = objectMap["name"];
    if(objectMap["imageUrl"] != null) this.imageUrl = objectMap["imageUrl"];
    if(objectMap["websiteUrl"] != null) this.websiteUrl = objectMap["websiteUrl"];
    if(objectMap["algorithm"] != null) this.algorithm = objectMap["algorithm"];
    if(objectMap["hashesPerSecond"] != null) this.hashesPerSecond = objectMap["hashesPerSecond"];
    if(objectMap["cost"] != null) this.cost = objectMap["cost"];
    if(objectMap["currency"] != null) this.currency = objectMap["currency"];
    if(objectMap["powerConsumption"] != null) this.powerConsumption = objectMap["powerConsumption"];
    if(objectMap["currencyAvailable"] != null) this.currencyAvailable = new CoinInfo.fromMap(objectMap["currencyAvailable"]);
    if(objectMap["equipmentType"] != null) this.equipmentType = objectMap["equipmentType"];
  }

  Map toMap(){
    Map objectMap = {};
    if(this.id != null) objectMap["id"] = this.id;
    if(this.name != null) objectMap["name"] = this.name;
    if(this.imageUrl != null) objectMap["imageUrl"] = this.imageUrl;
    if(this.websiteUrl != null) objectMap["websiteUrl"] = this.websiteUrl;
    if(this.algorithm != null) objectMap["algorithm"] = this.algorithm;
    if(this.hashesPerSecond != null) objectMap["hashesPerSecond"] = this.hashesPerSecond;
    if(this.cost != null) objectMap["cost"] = this.cost;
    if(this.currency != null) objectMap["currency"] = this.currency;
    if(this.powerConsumption != null) objectMap["powerConsumption"] = this.powerConsumption;
    if(this.currencyAvailable != null) objectMap["currencyAvailable"] = this.currencyAvailable.toMap();
    if(this.equipmentType != null) objectMap["equipmentType"] = this.equipmentType;
    return objectMap;
  }

}

//List<String> fields = [ "id","name","imageUrl","websiteUrl","algorithm","hashesPerSecond","cost","currency","powerConsumption","currencyAvailable","equipmentType"];
//
//fields.forEach((field){
//print('if(this.$field != null) objectMap["$field"] = this.$field;');
//print('if(objectMap["$field"] != null) this.${field} = objectMap["$field"];');
//});