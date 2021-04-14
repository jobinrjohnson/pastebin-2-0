import 'package:flutter/material.dart';

class PasteProvider with ChangeNotifier {
  updatePastesChanged() {
    this.notifyListeners();
  }
}
