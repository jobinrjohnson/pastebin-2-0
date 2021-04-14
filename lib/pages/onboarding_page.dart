import 'package:flutter/material.dart';
import 'package:pastebin/pages/signin.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboradingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnboradingPage();
}

class _OnboradingPage extends State<OnboradingPage> {
  buildBottomNavigBar() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Expanded(
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor)),
                    onPressed: () async {
                      var _url = "https://pastebin.com/signup";
                      await canLaunch(_url)
                          ? await launch(_url)
                          : throw 'Could not launch $_url';
                    },
                    child: Text("Register"))),
            Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage()),
                      );
                    },
                    child: Text("Sign In"))),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Hero(
                tag: "mainIcon_1",
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor
                        ],
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                          child: Text("pb",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 78,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white))),
                      SizedBox(height: 20),
                      Text(
                        "Welcome to Pastebin App",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "This is an Un official app for pastebin by an independent developer. This uses Official Pastebin APIs to fetch and update data to/from pastebin",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      )
                    ],
                  ),
                ))),
        this.buildBottomNavigBar()
      ],
    ));
  }
}
