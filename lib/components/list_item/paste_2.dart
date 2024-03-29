import 'package:flutter/material.dart';
import 'package:pastebin/models/paste.dart';
import 'package:pastebin/provider/paste_provider.dart';
import 'package:pastebin/services/pastebin.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class PasteStyle2 extends StatelessWidget {
  final PastebinPaste paste;
  final Function()? copyToClipBoard;

  const PasteStyle2({Key? key, required this.paste, this.copyToClipBoard})
      : super(key: key);

  buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (this.copyToClipBoard != null)
          IconButton(
              icon: Icon(Icons.copy),
              onPressed: this.copyToClipBoard,
              iconSize: 30,
              color: Colors.white),
        if (this.copyToClipBoard != null) SizedBox(width: 30),
        IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share('${paste.title} ${paste.url}');
            },
            iconSize: 30,
            color: Colors.white),
        SizedBox(width: 30),
        IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              new PastebinService().deletePaste(paste.key ?? '').then((value) {
                Provider.of<PasteProvider>(context, listen: false)
                    .updatePastesChanged();
                Navigator.of(context).pop();
              }).onError((error, stackTrace) {
                final snackBar =
                    SnackBar(content: Text('${error.toString()} '));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
            iconSize: 30,
            color: Colors.white),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).backgroundColor,
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor
                ],
              )),
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Text(
                paste.title.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              Text('${paste.hits} Views, ${paste.format}',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 5),
              Text('${paste.date} - ${paste.date}',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 15),
              this.buildActions(context)
            ],
          ),
        ));
  }
}
