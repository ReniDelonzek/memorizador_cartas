import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tema {
  static ThemeData getTema(BuildContext context, {bool darkMode = false}) {
    return ThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(elevation: 0),
        accentColor: getCorPadrao(),
        primaryColor: darkMode ? Colors.black : Colors.white,
        buttonColor: getCorPadrao(),
        scaffoldBackgroundColor: darkMode ? Colors.black : Colors.white,
        buttonTheme: ButtonThemeData(buttonColor: getCorPadrao()),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle:
                TextStyle(color: darkMode ? Colors.white60 : Colors.black87)));
    //visualDensity: VisualDensity.adaptivePlatformDensity);
  }
}

isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

getCorPadrao() {
  return Color(0xFF00823A);
}
