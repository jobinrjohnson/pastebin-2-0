import 'package:flutter/material.dart';
import 'package:pastebin/pages/home_page.dart';
import 'package:pastebin/pages/onboarding_page.dart';
import 'package:pastebin/provider/userprovider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      var provider = context.read<UserProvider>();
      await provider.init();

      bool isIn = provider.isLoggedIn;

      new Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 700),
                pageBuilder: (_, __, ___) =>
                    isIn ? MyHomePage() : OnboradingPage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "mainIcon_1",
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor
                    ],
                  )),
              margin: EdgeInsets.all(22),
              padding: EdgeInsets.all(26),
              child: Text("pb",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 78,
                      fontStyle: FontStyle.italic,
                      color: Colors.white))),
        ),
      ),
    );
  }
}
