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
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        InPageAppBar(requireSliver: true),
        SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: PasteStyle2(paste: this.widget.paste))),
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

          return SyntaxView(
            code: snapshot.data?.toString() ?? '',
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
