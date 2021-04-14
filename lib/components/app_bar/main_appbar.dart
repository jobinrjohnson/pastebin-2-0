import 'package:flutter/material.dart';
import 'package:pastebin/components/logo.dart';
import 'package:pastebin/models/user.dart';
import 'package:pastebin/pages/user_view_page.dart';
import 'package:pastebin/provider/userprovider.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() => _MainAppBar();

  @override
  Size get preferredSize => Size.fromHeight(90);
}

class _MainAppBar extends State<MainAppBar> {
  Widget buildLeading() {
    return Hero(tag: "mainIcon_1", child: Logo(margin: EdgeInsets.all(22)));
  }

  Widget buildFlexibleSpace() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Consumer<UserProvider>(
            builder: (context, UserProvider provider, child) {
          User? user = provider.user;

          return Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: widget.preferredSize.height),
                  Text("Welcome", style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 20),
                  Text(
                    '${user?.name ?? 'user'}',
                    style: Theme.of(context).textTheme.headline4)
                ],
              ));
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: this.buildLeading(),
      leadingWidth: 95,
      toolbarHeight: widget.preferredSize.height,
      pinned: true,
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: this.buildFlexibleSpace(),
      ),
      actions: [
        Consumer<UserProvider>(
            builder: (context, UserProvider provider, child) {
          User? user = provider.user;

          return IconButton(
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(user?.image ??
                  'https://pastebin.com/themes/pastebin/img/guest.png'),
            ),
            iconSize: 40,
            padding: EdgeInsets.all(20),
            tooltip: 'Show Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserViewPage()),
              );
            },
          );
        })
      ],
    );
  }
}
