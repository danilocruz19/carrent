import 'package:flutter/material.dart';

class ThemeApp extends ChangeNotifier {
  bool themeOn = false;

  void mudarThema(bool value) {
    themeOn = value;
    notifyListeners();
  }
}
