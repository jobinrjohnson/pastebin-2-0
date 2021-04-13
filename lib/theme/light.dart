import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  // primaryColor: Colors.lightBlue[800],
  // accentColor: Colors.cyan[600],

  primaryColor: Colors.lightBlue[800],
  accentColor: Colors.cyan[600],

  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87, width: 2.0),
        borderRadius: BorderRadius.circular(15)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(15)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87, width: 2.0),
        borderRadius: BorderRadius.circular(15)),
  ),

  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 25, horizontal: 40)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))))),

  backgroundColor: Color.fromRGBO(243, 243, 244, 1),
  // scaffoldBackgroundColor: Color.fromRGBO(243, 243, 244, 1),
  scaffoldBackgroundColor: Colors.white,

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
      headline1: TextStyle(fontWeight: FontWeight.bold),
      headline6: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
      bodyText2: TextStyle(fontSize: 14.0, height: 1.4),
      bodyText1: TextStyle(fontSize: 14.0, height: 2),
      button: TextStyle(fontSize: 16)),
);
