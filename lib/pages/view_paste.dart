import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';
import 'package:pastebin/components/list_item/paste_2.dart';
import 'package:pastebin/models/paste.dart';
import 'package:pastebin/services/pastebin.dart';

class PasteViewPage extends StatefulWidget {
  final PastebinPaste paste;

  const PasteViewPage({Key? key, required this.paste}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasteView();
}

class _PasteView extends State<PasteViewPage> {
  String copyText = "";

  Widget build(BuildContext context) {
    copyToClipBoard() {
      FlutterClipboard.copy(copyText).then((value) {
        final snackBar = SnackBar(content: Text('Copied'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        InPageAppBar(requireSliver: true),
        SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: PasteStyle2(
                  paste: this.widget.paste,
                  copyToClipBoard: copyToClipBoard,
                ))),
        if (widget.paste.format == "text" || widget.paste.format == "none")
          SliverToBoxAdapter(
              child: Container(
            child: this.buildSyntaxHiliter(),
            padding: EdgeInsets.only(left: 20),
          ))
        else
          SliverFillRemaining(
              child: Container(
            child: this.buildSyntaxHiliter(),
            padding: EdgeInsets.only(left: 20),
                  ))
          ],
        ));
  }

  buildSyntaxHiliter() {
    return FutureBuilder(
        future: new PastebinService().getRawPost(widget.paste.key!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Some Error Occurred"),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (widget.paste.format == "text" || widget.paste.format == "none") {
            return SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        right: 25, left: 10, top: 20, bottom: 30),
                    child: Text(snapshot.data?.toString() ?? '')));
          }

          copyText = snapshot.data?.toString() ?? '';

          return SyntaxView(
            code: copyText,
            syntax: Syntax.YAML,
            syntaxTheme: Theme.of(context).brightness == Brightness.light
                ? SyntaxTheme.vscodeLight()
                : SyntaxTheme.vscodeDark(),
            fontSize: 14.0,
            withZoom: true,
            withLinesCount: true,
            expanded: true,
          );
        });
  }

  buildFlexibleSpace(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.paste.title} ',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text('${widget.paste.hits} Views, ${widget.paste.format}',
              style: TextStyle(color: Colors.white)),
          SizedBox(height: 8),
          Text('${widget.paste.date} - ${widget.paste.date}',
              style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
