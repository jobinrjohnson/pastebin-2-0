import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';
import 'package:pastebin/pages/about_page.dart';
import 'package:pastebin/pages/privacy_policy_page.dart';

import 'add_paste_page.dart';

class UserViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserViewPage();
}

class _UserViewPage extends State<UserViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InPageAppBar(),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
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
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPastePage()),
                          );
                        },
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
                        ))),
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

            // Our apps

            SizedBox(height: 40),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
              title: Text("About the App"),
              subtitle: Text("See about the application."),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),

            SizedBox(height: 5),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                );
              },
              title: Text("Privacy Policy"),
              subtitle: Text("See Privacy policy of the application."),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            )
          ],
        ));
  }
}
