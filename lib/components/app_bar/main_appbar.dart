import 'package:flutter/material.dart';
import 'package:pastebin/components/logo.dart';

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
        IconButton(
          icon: const Icon(Icons.house),
          iconSize: 30,
          padding: EdgeInsets.all(20),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
    );
  }
}
