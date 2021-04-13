class User {
  String? name;
  String? avatarUrl;
  String? website;
  String? email;

  get image {
    return avatarUrl?.replaceFirst("@", "https://pastebin.com/");
  }

  User({this.name, this.avatarUrl, this.email, this.website});

  toMap() {
    return {
      "name": name,
      "avatar": avatarUrl,
      "website": website,
      "email": email
    };
  }

  static fromMap(Map<String, dynamic> data) {
    return new User(
      name: data['name'],
      avatarUrl: data['avatar'],
      website: data['website'],
      email: data['email'],
    );
  }
}
