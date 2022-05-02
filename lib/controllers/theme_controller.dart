import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkThemed = false;

  changeTheme() {
    isDarkThemed = !isDarkThemed;

    notifyListeners();
  }
}
