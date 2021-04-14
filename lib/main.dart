import 'package:flutter/material.dart';
import 'package:pastebin/pages/splash_page.dart';
import 'package:pastebin/provider/paste_provider.dart';
import 'package:pastebin/provider/userprovider.dart';
import 'package:pastebin/theme/light.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<PasteProvider>(create: (_) => PasteProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        home: SplashPage(),
      ),
    );
  }
}
