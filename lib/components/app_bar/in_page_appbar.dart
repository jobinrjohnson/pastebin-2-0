import 'package:flutter/material.dart';

class InPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool requireSliver;

  const InPageAppBar({Key? key, this.requireSliver = false}) : super(key: key);

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
        child: Icon(Icons.undo));
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.requireSliver) {
      return SliverAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          child: this.buildLeading(),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 95,
        toolbarHeight: widget.preferredSize.height,
        pinned: true,
      );
    }

    return AppBar(
        leading: InkWell(
          child: this.buildLeading(),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 95,
        backgroundColor: Colors.transparent,
        toolbarHeight: widget.preferredSize.height);
  }
}
