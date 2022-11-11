import 'package:flutter/material.dart';

class CurrentTheme {
  final kprofilrTextstyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.normal);
  static ThemeData customTheme = ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFf6f6f6),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFFfa6e0f),
      ),
      appBarTheme: const AppBarTheme(
          color: Color(0xFFf6f6f6),
          elevation: 0,
          foregroundColor: Colors.black,
          actionsIconTheme: IconThemeData(color: Color(0xFFfa6e0f))),
      cardColor: const Color(0xFFfefefe),
      // buttonColor: const Color(0xFFfa6e0f),
      dividerColor: const Color(0xFFfefefe),
      focusColor: const Color(0xFFfa6e0f),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2.0,
              color: Color(0xFFfa6e0f),
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.0,
            color: Color(0xFFfa6e0f),
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                width: 2.0, color: Color.fromARGB(255, 241, 109, 99))),
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
      ));
}
