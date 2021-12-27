import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateNotifer extends ChangeNotifier {
  bool isdarkModeOn = false;

  checkPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("dark")) {
      updateMode(pref.getBool("dark"));
    } else {
      updateMode(false);
    }
  }

  void updateMode(bool isDarkModeOn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    this.isdarkModeOn = isDarkModeOn;
    pref.setBool("dark", isDarkModeOn);
    notifyListeners();
  }
}
