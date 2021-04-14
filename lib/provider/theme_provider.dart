import 'package:flutter/material.dart';
import 'package:pastebin/theme/dark.dart';
import 'package:pastebin/theme/light.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late SharedPreferences prefs;

  int themeId = 0;

  ThemeProvider() {
    init();
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
    this.themeId = prefs.getInt("themeId") ?? 0;
    notifyListeners();
  }

  ThemeData get theme {
    if (themeId == 0)
      return lightTheme;
    else
      return darkTheme;
  }

  setTheme(int themeId) {
    this.themeId = themeId;
    prefs.setInt("themeId", themeId);
    notifyListeners();
  }
}
