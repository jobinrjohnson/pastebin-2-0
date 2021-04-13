import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
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
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100))),
            backgroundColor: Theme.of(context).accentColor,
            flexibleSpace: this.buildFlexibleSpace(context),
            floating: true,
            snap: true,
            expandedHeight: 300.0,
            forceElevated: innerBoxIsScrolled,
          ),
        )
      ];
    }, body: Builder(builder: (BuildContext context) {
      return this.buildSyntaxHiliter();
    })));
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
