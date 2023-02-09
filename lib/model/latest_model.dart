class LatestModel {
  int? id;
  String? imageUrl;
  String? title;
  String? overview;
  dynamic rate;
  String? date;

  LatestModel({
    this.id,
    this.title,
    this.overview,
    this.imageUrl,
    this.rate,this.date
  });

  LatestModel.fromJson(dynamic json) {
    id = json['id'];
    imageUrl = json['backdrop_path'];
    title = json['original_title'];
    overview = json['overview'];
    date  = json['release_date'];
    rate = json['vote_average'];
  }
}
