import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentlanguge = 'en';

  void changeLanguageCode(String newlangugecode) {
    if (currentlanguge == newlangugecode) return;

    currentlanguge = newlangugecode;
    notifyListeners();
  }

}
