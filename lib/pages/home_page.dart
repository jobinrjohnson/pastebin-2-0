import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/main_appbar.dart';
import 'package:pastebin/components/list_item/paste_1.dart';
import 'package:pastebin/models/paste.dart';
import 'package:pastebin/pages/add_paste_page.dart';
import 'package:pastebin/services/pastebin.dart';

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
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: this.buildListView(),
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
    );
  }

  Widget buildListView() {
    return FutureBuilder(
      future: new PastebinService().getMyPastes(),
      builder: (context, AsyncSnapshot<List<PastebinPaste>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Some error occurred"));
        }

        if (!snapshot.hasData) {
          return Center(child: Text("No Data"));
        }

        return ListView.builder(
          itemCount: (snapshot.data?.length ?? 0) + 2,
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (context, index) {
            if (index == (snapshot.data?.length ?? 0) + 1) {
              return SizedBox(height: 80);
            }

            if (index == 0) {
              return Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Welcome",
                          style: Theme.of(context).textTheme.headline4),
                      SizedBox(height: 20),
                      Text(
                        "Jobin Johnson",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      )
                    ],
                  ));
            }

            PastebinPaste paste = snapshot.data![index - 1];

            return Container(
                margin: EdgeInsets.all(10),
                child: PasteStyle1(
                  paste: paste,
                ));
          },
        );
      },
    );
  }
}
