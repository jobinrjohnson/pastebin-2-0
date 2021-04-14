class User {
  String? name;
  String? avatarUrl;
  String? website;
  String? email;

  get image {
    if (avatarUrl == null || avatarUrl!.startsWith("@"))
      return "https://pastebin.com/themes/pastebin/img/guest.png";
    return 'https://pastebin.com/$avatarUrl';
  }

  get url {
    return 'https://pastebin.com/u/${this.name}';
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
