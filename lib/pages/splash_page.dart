import 'package:flutter/material.dart';
import 'package:pastebin/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => MyHomePage())
            // MaterialPageRoute(builder: (context) => MyHomePage()),
            ));
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
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
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
