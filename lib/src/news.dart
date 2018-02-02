part of crypto_exchange_model;

class News {
  String title;
  String url;
  String imageUrl;
  String source;
  List<String> tags;
  DateTime publishedDate;
  String body;
  String language;

  News(this.title, this.url, this.imageUrl, this.source, this.tags,
      this.publishedDate, this.body, this.language);

  News.fromMap(Map objectMap){
    if(objectMap["title"] != null) this.title = objectMap["title"];
    if(objectMap["url"] != null) this.url = objectMap["url"];
    if(objectMap["imageUrl"] != null) this.imageUrl = objectMap["imageUrl"];
    if(objectMap["source"] != null) this.source = objectMap["source"];
    if(objectMap["tags"] != null) this.tags = objectMap["tags"];
    if(objectMap["publishedDate"] != null) this.publishedDate = new DateTime.fromMillisecondsSinceEpoch(objectMap["publishedDate"]);
    if(objectMap["body"] != null) this.body = objectMap["body"];
    if(objectMap["language"] != null) this.language = objectMap["language"];
  }

  Map toMap(){
    Map objectMap = {};
    if(this.title != null) objectMap["title"] = this.title;
    if(this.url != null) objectMap["url"] = this.url;
    if(this.imageUrl != null) objectMap["imageUrl"] = this.imageUrl;
    if(this.source != null) objectMap["source"] = this.source;
    if(this.tags != null) objectMap["tags"] = this.tags;
    if(this.publishedDate != null) objectMap["publishedDate"] = this.publishedDate.millisecondsSinceEpoch;
    if(this.body != null) objectMap["body"] = this.body;
    if(this.language != null) objectMap["language"] = this.language;
    return objectMap;
  }

}