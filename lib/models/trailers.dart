class TrailersModel {
  int? id;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  String? publishedAt;
  bool? official;

  TrailersModel(
      {this.id,
      this.key,
      this.name,
      this.official,
      this.publishedAt,
      this.site,
      this.size,
      this.type});

  TrailersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    publishedAt = json['published_at'];
    official = json['official'];
  }

}

/*class Results {

  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  String? publishedAt;
  bool? official;


  Results(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.publishedAt,
      this.official,
      this.id});

  Results.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    publishedAt = json['published_at'];
    official = json['official'];
    id = json['id'];
  }
}
*/