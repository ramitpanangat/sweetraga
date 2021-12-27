import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
      accentColor: Color.fromRGBO(208, 171, 107, 1),
      brightness: Brightness.light,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Color.fromRGBO(208, 171, 107, 1))),
      cardTheme: CardTheme(
          elevation: 3, shadowColor: Color.fromRGBO(208, 171, 107, 1)),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Color.fromRGBO(208, 171, 107, 1),
            fontWeight: FontWeight.bold,
            fontSize: 25),
        headline2: TextStyle(
            color: Color.fromRGBO(208, 171, 107, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Color.fromRGBO(208, 171, 107, 1)),
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.grey,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color.fromRGBO(114, 94, 87, 1),
        ),
        bodyText2: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(color: Colors.grey[400], fontSize: 18),
      ),
      scaffoldBackgroundColor: Colors.white);

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.grey[850],
    accentColor: Color.fromRGBO(208, 171, 107, 1),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey[800]),
    brightness: Brightness.dark,
    canvasColor: Colors.black,
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.grey[850],
        iconTheme: IconThemeData(color: Color.fromRGBO(208, 171, 107, 1))),
    cardTheme: CardTheme(elevation: 5, shadowColor: Colors.grey[800]),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Color.fromRGBO(208, 171, 107, 1),
          fontWeight: FontWeight.bold,
          fontSize: 25),
      headline2: TextStyle(
          color: Color.fromRGBO(208, 171, 107, 1),
          fontSize: 16,
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Color.fromRGBO(208, 171, 107, 1)),
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.grey[200],
      ),
      headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color.fromRGBO(196, 178, 171, 1)),
      bodyText1: TextStyle(color: Colors.grey, fontSize: 18),
      bodyText2: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
