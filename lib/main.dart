import 'package:flutter/material.dart';
import 'package:pastebin/pages/splash_page.dart';
import 'package:pastebin/theme/light.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: SplashPage(),
    );
  }
}
