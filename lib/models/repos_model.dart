class ReposModel {
  int id;
  String name;
  int stars;
  String language;

  ReposModel({this.id, this.name, this.stars, this.language});

  factory ReposModel.fromJson(Map<String, dynamic> json) {
    return ReposModel(
      id: json["id"],
      name: json["name"],
      stars: json["stargazers_count"],
      language: json["language"],
    );
  }
}
