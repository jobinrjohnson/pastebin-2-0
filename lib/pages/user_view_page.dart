import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';

class UserViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserViewPage();
}

class _UserViewPage extends State<UserViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InPageAppBar(),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Hey,", style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 20),
            Text(
              "Jobin Johnson",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(height: 40),

            // Account box

            Material(
              elevation: 3,
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 10),
                    Text("See your pastebin home on website.",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.white70)),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Row

            Row(
              children: [
                Expanded(
                    child: Material(
                  elevation: 3,
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Add Paste",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white)),
                        SizedBox(height: 10),
                        Text("Create new paste on pastebin.",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.white70)),
                      ],
                    ),
                  ),
                )),
                SizedBox(width: 20),
                Expanded(
                    child: Material(
                  elevation: 3,
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Logout",
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 10),
                        Text("Log out from this application",
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ],
        ));
  }
}
