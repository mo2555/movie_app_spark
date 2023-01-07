class GenreDataModel {
  GenreDataModel({
      this.id, 
      this.name,});

  GenreDataModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
}