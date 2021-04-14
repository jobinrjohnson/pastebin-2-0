import 'package:flutter/material.dart';
import 'package:pastebin/theme/dark.dart';
import 'package:pastebin/theme/light.dart';

class ThemeProvider with ChangeNotifier {
  int themeId = 0;

  ThemeData get theme {
    if (themeId == 0)
      return lightTheme;
    else
      return darkTheme;
  }

  setTheme(int themeId) {
    this.themeId = themeId;
    notifyListeners();
  }
}
