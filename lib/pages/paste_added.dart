import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';
import 'package:pastebin/components/list_item/paste_2.dart';
import 'package:pastebin/models/paste.dart';
import 'package:pastebin/pages/view_paste.dart';

class PasteAddedPage extends StatelessWidget {
  final PastebinPaste paste;

  const PasteAddedPage({Key? key, required this.paste}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InPageAppBar(),
      body: Container(
          padding: EdgeInsets.only(bottom: 40, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PasteStyle2(paste: paste),
              SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasteViewPage(paste: paste)),
                    );
                  },
                  child: Padding(
                    child: Text("View Paste"),
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ))
            ],
          )),
    );
  }
}
