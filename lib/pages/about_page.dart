import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
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
            Text("About", style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 20),
            Text(
              "This Application",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
                "This is an Un official app for pastebin by an independent developer. This uses Official Pastebin APIs to fetch and update data to/from pastebin"),
            Text(
                "Pastebin is the simple application built for android 5.0 and above. This uses the pastebin API for listing and retrieving pastes form the pastebin server"),
            SizedBox(height: 20),
            Text("What is Pastebin?",
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            Text(
                "Pastebin is a website where you can store any text online for easy sharing. The website is mainly used by programmers to store pieces of sources code or configuration information, but anyone is more than welcome to paste any type of text. The idea behind the site is to make it more convenient for people to share large amounts of text online."),
            SizedBox(height: 40),
            GestureDetector(
                onTap: () async {
                  var _url = "https://jobinrjohnson.in/";
                  await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';
                },
                child: Material(
                  elevation: 3,
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("@jobinrjohnson",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white)),
                            SizedBox(height: 10),
                            Text(
                                "See developer information at jobinrjohnson.in",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.white70)),
                          ],
                        )),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white70,
                        )
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 50),
          ],
        ));
  }
}
