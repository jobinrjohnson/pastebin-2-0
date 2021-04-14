import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';
import 'package:pastebin/constants/pastebin_types.dart';
import 'package:pastebin/models/paste.dart';
import 'package:pastebin/pages/paste_added.dart';
import 'package:pastebin/provider/paste_provider.dart';
import 'package:pastebin/services/pastebin.dart';
import 'package:provider/provider.dart';

class AddPastePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPastePage();
}

class _AddPastePage extends State<AddPastePage> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _pasteController = new TextEditingController();
  bool isPrivate = false;
  String dropdownValue = 'none';

  bool isLoading = false;

  _savePost() {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    PastebinPaste p = new PastebinPaste(
        title: _titleController.text,
        format: dropdownValue,
        hits: 0,
        size: _pasteController.text.length.toString(),
        isPrivate: isPrivate);

    PastebinService()
        .create(
        title: _titleController.text,
        paste: _pasteController.text,
        type: dropdownValue,
        isPrivate: isPrivate)
        .then((value) {
      Provider.of<PasteProvider>(context, listen: false).updatePastesChanged();
      p.url = value;
      p.key = value.replaceAll("https://pastebin.com/", "").trim();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => PasteAddedPage(paste: p)));
    }).onError((error, stackTrace) {
      final snackBar = SnackBar(content: Text('${error.toString()} '));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  buildBottomNavigBar() {
    return Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(bottom: 30, left: 40, right: 40, top: 2),
        child: TextButton(
            onPressed: _savePost,
            child: Padding(
              child: Text("Create Paste"),
              padding: EdgeInsets.symmetric(vertical: 5),
            )));
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
          TextFormField(
            decoration: InputDecoration(hintText: "Title"),
            controller: _titleController,
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _pasteController,
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
