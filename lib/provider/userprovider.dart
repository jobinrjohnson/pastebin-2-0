import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pastebin/models/user.dart';
import 'package:pastebin/services/pastebin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  late SharedPreferences prefs;

  String? authString;

  User? user;

  void notifyListeners() {
    PastebinService.authString = this.authString;
    super.notifyListeners();
  }

  get isLoggedIn {
    return authString != null && authString!.length > 1;
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
    this.authString = prefs.getString("authString") ?? null;

    String? user = prefs.getString("user") ?? null;
    if (user != null) {
      this.user = User.fromMap(jsonDecode(user));
      this.setupRemoteUser();
    }
    notifyListeners();
  }

  setupRemoteUser() {
    PastebinService().getUser(this.authString!).then((value) {
      this.user = value;
      prefs.setString("user", jsonEncode(user?.toMap()));
      notifyListeners();
    }).onError((error, stackTrace) {});
  }

  login(String authString) async {
    this.authString = authString;
    await prefs.setString("authString", authString);
    this.setupRemoteUser();
    notifyListeners();
  }

  logOut() async {
    this.authString = null;
    await prefs.remove("authString");
    await prefs.remove("user");
    notifyListeners();
  }
}
