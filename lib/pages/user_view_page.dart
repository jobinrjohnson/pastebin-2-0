import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';
import 'package:pastebin/models/user.dart';
import 'package:pastebin/pages/about_page.dart';
import 'package:pastebin/pages/privacy_policy_page.dart';
import 'package:pastebin/pages/splash_page.dart';
import 'package:pastebin/provider/theme_provider.dart';
import 'package:pastebin/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: Consumer<UserProvider>(
            builder: (context, UserProvider provider, child) {
          return buildBody(context, provider);
        }),
      ),
    );
  }

  buildBody(BuildContext context, UserProvider provider) {
    User? user = provider.user;
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Hey,", style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 20),
            Text(
              '${user?.name} ',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 3),
            Text('${user?.email ?? ' '} ${user?.website ?? ' '}',
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 40),

            // Account box

            GestureDetector(
                onTap: () async {
                  var _url = user?.url;
                  await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';
                },
                child: Material(
                  elevation: 3,
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            user?.image,
                            width: 50,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
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
                        ))
                      ],
                    ),
                  ),
                )),

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
                    child: InkWell(
                        onTap: () {
                          provider.logOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashPage()),
                              (Route<dynamic> route) => false);
                        },
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
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                SizedBox(height: 10),
                                Text("Log out from this application",
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                          ),
                        ))),
              ],
            ),

            // Our apps

            SizedBox(height: 40),
            Consumer<ThemeProvider>(
              builder: (context, ThemeProvider themeProvider, child) {
                return ListTile(
                  onTap: () {
                    themeProvider.setTheme(themeProvider.themeId == 0 ? 1 : 0);
                  },
                  title: Text(
                      'Switch to ${themeProvider.themeId == 0 ? 'dark' : 'light'} mode'),
                  subtitle: Text("Change the application theme."),
                  trailing: Icon(Icons.circle,
                      color: themeProvider.themeId == 0
                          ? Colors.black
                          : Colors.white),
                );
              },
            ),

            SizedBox(height: 5),

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
