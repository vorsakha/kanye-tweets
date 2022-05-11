import 'package:flutter/material.dart';

ThemeController currentTheme = ThemeController();

class ThemeController extends ChangeNotifier {
  static ThemeController instance = ThemeController();

  static bool isDarkThemed = true;

  ThemeMode get currentTheme => isDarkThemed ? ThemeMode.dark : ThemeMode.light;

  changeTheme() {
    isDarkThemed = !isDarkThemed;

    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.red,
      backgroundColor: const Color.fromARGB(255, 255, 237, 235),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 237, 235),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.white,
        primary: Colors.red,
        tertiary: const Color.fromARGB(255, 199, 80, 71),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.grey[850],
      primarySwatch: Colors.amber,
      backgroundColor: Colors.grey[850],
      scaffoldBackgroundColor: Colors.grey[800],
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.grey[850],
        primary: const Color.fromARGB(255, 169, 43, 34),
        tertiary: const Color.fromARGB(255, 230, 116, 107),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }
}
