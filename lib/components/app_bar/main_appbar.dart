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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: this.buildLeading(),
      leadingWidth: 95,
      backgroundColor: Colors.transparent,
      toolbarHeight: widget.preferredSize.height,
      actions: [
        Consumer<UserProvider>(
            builder: (context, UserProvider provider, child) {
          User? user = provider.user;

          return IconButton(
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(user?.image),
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
