import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.lightBlue[800],
  accentColor: Colors.cyan[600],

  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Color.fromRGBO(243, 243, 244, 1),

  appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(243, 243, 244, 1),
      elevation: 0,
      foregroundColor: Colors.black54,
      actionsIconTheme: IconThemeData(color: Colors.black54)),

  // Define the default font family.
  fontFamily: 'Georgia',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black54),
    headline6: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
