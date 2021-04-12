import 'package:flutter/material.dart';

class InPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() => _MainAppBar();

  @override
  Size get preferredSize => Size.fromHeight(90);
}

class _MainAppBar extends State<InPageAppBar> {
  Widget buildLeading() {
    return Container(
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
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        padding: EdgeInsets.all(8),
        child: Icon(Icons.undo)

        // Text("pb",
        //     style: Theme.of(context).textTheme.headline6!.copyWith(
        //         fontSize: 28,
        //         fontStyle: FontStyle.italic,
        //         color: Colors.white)

        );
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
