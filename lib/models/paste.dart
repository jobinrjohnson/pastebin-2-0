import 'package:intl/intl.dart';

class PastebinPaste {
  String? key;
  String? pasteDate;
  String? pasteExpiryDate;
  String? title;
  String? size;
  bool isPrivate;
  int hits;
  String? format;
  String? url;

  get date {
    if (pasteDate == null) {
      return DateFormat.yMMMd().format(DateTime.now());
    }
    var date =
        new DateTime.fromMillisecondsSinceEpoch(int.parse(pasteDate!) * 1000);
    return DateFormat.yMMMd().format(date);
  }

  PastebinPaste({
    this.key,
    this.size,
    this.title,
    this.url,
    this.format,
    this.hits = 0,
    this.isPrivate = false,
    this.pasteDate,
    this.pasteExpiryDate,
  });
}
