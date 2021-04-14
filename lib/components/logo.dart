import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final EdgeInsetsGeometry? margin;

  const Logo({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        margin: margin,
        padding: EdgeInsets.all(8),
        child: SizedBox(
          child: Text("pb",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: Colors.white)),
          width: 32,
          height: 32,
        ));
  }
}
