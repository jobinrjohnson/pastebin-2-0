import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';
import 'package:pastebin/constants/pastebin_types.dart';

class AddPastePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPastePage();
}

class _AddPastePage extends State<AddPastePage> {
  buildBottomNavigBar() {
    return Container(
        padding: EdgeInsets.all(40),
        child: TextButton(
            onPressed: () {},
            child: Padding(
              child: Text("Create Paste"),
              padding: EdgeInsets.symmetric(vertical: 5),
            )));
  }

  bool isPrivate = false;
  String dropdownValue = 'javascript';

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
          SizedBox(height: 20),
          DropdownButtonFormField(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: pastebinTypes.keys
                  .map<DropdownMenuItem<String>>((String key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Text(pastebinTypes[key]!),
                );
              }).toList()),
          SizedBox(height: 10),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    value: isPrivate,
                    onChanged: (bb) {
                      setState(() {
                        isPrivate = bb ?? false;
                      });
                    }),
                Text("Private Paste")
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InPageAppBar(),
      bottomNavigationBar: this.buildBottomNavigBar(),
      body: SingleChildScrollView(child: buildForm()),
    );
  }
}
