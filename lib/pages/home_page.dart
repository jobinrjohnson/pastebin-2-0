import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pastebin/components/app_bar/main_appbar.dart';
import 'package:pastebin/components/list_item/paste_1.dart';
import 'package:pastebin/models/paste.dart';
import 'package:pastebin/pages/add_paste_page.dart';
import 'package:pastebin/provider/paste_provider.dart';
import 'package:pastebin/services/pastebin.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body = Consumer<PasteProvider>(
        builder: (context, value, child) => FutureBuilder(
            future: new PastebinService().getMyPastes(),
            builder: (context, snapshot) {
              return CustomScrollView(
                slivers: <Widget>[
                  MainAppBar(),
                  if (!snapshot.hasData) buildSkleton(),
                  if (snapshot.hasData) buildListView(snapshot),
                ],
              );
            }));

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPastePage()),
            );
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        body: body);
  }

  Widget buildSkleton() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor,
                child: ListTile(title: SizedBox(height: 120)),
              ));
        },
        childCount: 5,
      ),
    );
  }

  getBannerAd() {
    final AdSize adSize = AdSize(width: 320, height: 100);
    final BannerAd myBanner = BannerAd(
      adUnitId: 'ca-app-pub-6479565236772083/4482831378',
      size: adSize,
      request: AdRequest(),
      listener: AdListener(),
    );
    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );

    return adContainer;
  }

  Widget buildListView(snapshot) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == snapshot.data.length) {
            return SizedBox(height: 100);
          }

          PastebinPaste paste = snapshot.data![index];
          var pasteItem = Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: PasteStyle1(
                paste: paste,
              ));

          if (index % 3 == 1) {
            return Column(children: [
              getBannerAd(),
              pasteItem,
            ]);
          }

          return pasteItem;
        },
        childCount: snapshot.data.length + 1,
      ),
    );
  }
}
