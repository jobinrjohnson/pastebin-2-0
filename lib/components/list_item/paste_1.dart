import 'package:flutter/material.dart';
import 'package:pastebin/models/paste.dart';
import 'package:pastebin/pages/view_paste.dart';

class PasteStyle1 extends StatelessWidget {
  final PastebinPaste paste;

  const PasteStyle1({Key? key, required this.paste}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).backgroundColor,
        // elevation: 10,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PasteViewPage(paste: paste)),
            );
          },
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          title: Text(
            paste.title.toString(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black87, fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('${paste.hits} Views, ${paste.format}'),
              SizedBox(height: 2),
              Text('${paste.date} - ${paste.date}')
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ));
  }
}
