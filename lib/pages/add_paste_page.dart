import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';

class AddPastePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPastePage();
}

class _AddPastePage extends State<AddPastePage> {
  buildBottomNavigBar() {
    return Container(
        padding: EdgeInsets.all(40),
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20),
            TextButton(
                onPressed: () {},
                child: Padding(
                  child: Text("Create Paste"),
                  padding: EdgeInsets.symmetric(vertical: 5),
                ))
          ],
        ));
  }

  Widget buildForm() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Create Paste.",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(
            "Add a new pastebin paste to your account.",
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 16),
          ),
          SizedBox(height: 40),
          TextFormField(decoration: InputDecoration(hintText: "Title")),
          SizedBox(height: 20),
          TextFormField(
            minLines: 10,
            maxLines: 20000,
            decoration: InputDecoration(hintText: "Paste"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InPageAppBar(),
      bottomNavigationBar: this.buildBottomNavigBar(),
      body: buildForm(),
    );
  }
}
