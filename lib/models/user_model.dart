class UserModel {
  String login;
  String avatarUrl;
  String name;
  String bio;
  String location;

  UserModel({this.login, this.avatarUrl, this.name, this.bio, this.location});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json["login"],
      avatarUrl: json["avatar_url"],
      name: json["name"],
      bio: json["bio"],
      location: json["location"],
    );
  }
}
