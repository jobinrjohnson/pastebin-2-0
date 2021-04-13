import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  late SharedPreferences prefs;

  String? authString;

  get isLoggedIn {
    return authString != null && authString!.length > 1;
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
    this.authString = prefs.getString("authString") ?? null;
    notifyListeners();
  }

  login(String authString) async {
    this.authString = authString;
    await prefs.setString("authString", authString);
    notifyListeners();
  }

  logOut() async {
    this.authString = null;
    await prefs.remove("authString");
    notifyListeners();
  }
}
