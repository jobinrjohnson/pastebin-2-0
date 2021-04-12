import 'package:http/http.dart' as http;
import 'package:pastebin/models/paste.dart';
import 'package:xml/xml.dart';

class PastebinService {
  get apiKey => "54264ef0696e0c17fd50c62d5685e1a8";

  String getUrl({trailing}) {
    String url = "https://pastebin.com/api";

    if (trailing != null) {
      url += trailing;
    }
    return url;
  }

  login(userName, password) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(this.getUrl(trailing: '/api_login.php')));
    request.fields.addAll({
      'api_dev_key': this.apiKey,
      'api_user_name': userName,
      'api_user_password': password
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  getRawPost(String postId) async {
    var response =
        await http.get(Uri.parse('https://pastebin.com/raw/' + postId));
    return response.body;
  }

  getAttr(XmlElement element, key) {
    try {
      var elms = element.findElements(key);
      if (elms.length > 0) {
        return elms.first.text;
      }
    } catch (e) {}
    return null;
  }

  Future<List<PastebinPaste>> getMyPastes() async {
    List<PastebinPaste> pastes = [];

    final bookshelfXml = '''<?xml version="1.0"?>
    <data>
      <paste>
        <paste_key>SBrUr0xd</paste_key>
        <paste_date>1297953260</paste_date>
        <paste_title>Abstract Noun</paste_title>
        <paste_size>15</paste_size>
        <paste_expire_date>1297956860</paste_expire_date>
        <paste_private>0</paste_private>
        <paste_format_long>JavaScript</paste_format_long>
        <paste_format_short>javascript</paste_format_short>
        <paste_url>https://pastebin.com/0b42rwhf</paste_url>
        <paste_hits>15</paste_hits>
      </paste>
      <paste>
        <paste_key>0b42rwhf</paste_key>
        <paste_date>1297953260</paste_date>
        <paste_title>Video Interval Calculator v1.1</paste_title>
        <paste_size>15</paste_size>
        <paste_expire_date>1297956860</paste_expire_date>
        <paste_private>0</paste_private>
        <paste_format_long>JavaScript</paste_format_long>
        <paste_format_short>javascript</paste_format_short>
        <paste_url>https://pastebin.com/0b42rwhf</paste_url>
        <paste_hits>15</paste_hits>
      </paste>
      <paste>
        <paste_key>0b42rwhf</paste_key>
        <paste_date>1297953260</paste_date>
        <paste_title>Github-IPTV-Parser.bat</paste_title>
        <paste_size>15</paste_size>
        <paste_expire_date>1297956860</paste_expire_date>
        <paste_private>0</paste_private>
        <paste_format_long>JavaScript</paste_format_long>
        <paste_format_short>javascript</paste_format_short>
        <paste_url>https://pastebin.com/0b42rwhf</paste_url>
        <paste_hits>15</paste_hits>
      </paste>
      <paste>
        <paste_key>0b42rwhf</paste_key>
        <paste_date>1297953260</paste_date>
        <paste_title>Tk_2D_Perlin_Noise_Plus.py</paste_title>
        <paste_size>15</paste_size>
        <paste_expire_date>1297956860</paste_expire_date>
        <paste_private>0</paste_private>
        <paste_format_long>JavaScript</paste_format_long>
        <paste_format_short>javascript</paste_format_short>
        <paste_url>https://pastebin.com/0b42rwhf</paste_url>
        <paste_hits>15</paste_hits>
      </paste>
      <paste>
        <paste_key>0b42rwhf</paste_key>
        <paste_date>1297953260</paste_date>
        <paste_title>javascript test</paste_title>
        <paste_size>15</paste_size>
        <paste_expire_date>1297956860</paste_expire_date>
        <paste_private>0</paste_private>
        <paste_format_long>JavaScript</paste_format_long>
        <paste_format_short>javascript</paste_format_short>
        <paste_url>https://pastebin.com/0b42rwhf</paste_url>
        <paste_hits>15</paste_hits>
      </paste>
      <paste>
        <paste_key>0C343n0d</paste_key>
        <paste_date>1297694343</paste_date>
        <paste_title>Welcome To Pastebin V3</paste_title>
        <paste_size>490</paste_size>
        <paste_expire_date>0</paste_expire_date>
        <paste_private>0</paste_private>
        <paste_format_long>None</paste_format_long>
        <paste_format_short>text</paste_format_short>
        <paste_url>https://pastebin.com/0C343n0d</paste_url>
        <paste_hits>65</paste_hits>
      </paste>
    </data>''';
    final document = XmlDocument.parse(bookshelfXml);

    document.findAllElements('paste').forEach((element) {
      PastebinPaste p = new PastebinPaste(
        key: getAttr(element, 'paste_key'),
        size: getAttr(element, 'paste_size'),
        format: getAttr(element, 'paste_format_short'),
        hits: int.tryParse(getAttr(element, 'paste_hits')) ?? 0,
        url: getAttr(element, 'paste_url'),
        isPrivate: getAttr(element, 'paste_private') == 1 ? true : false,
        pasteDate: getAttr(element, 'paste_date'),
        pasteExpiryDate: getAttr(element, 'paste_expire_date'),
        title: getAttr(element, 'paste_title'),
      );
      pastes.add(p);
    });

    return pastes;
  }
}
