import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pastebin/pages/splash_page.dart';
import 'package:pastebin/provider/paste_provider.dart';
import 'package:pastebin/provider/theme_provider.dart';
import 'package:pastebin/provider/userprovider.dart';
import 'package:provider/provider.dart';

void main() {
  // Google Ads
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  // End of Google Ads

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<PasteProvider>(create: (_) => PasteProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider provider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: provider.theme,
          home: SplashPage(),
        ),
      ),
    );
  }
}
