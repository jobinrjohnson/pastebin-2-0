import 'package:http/http.dart' as http;
import 'package:pastebin/models/paste.dart';
import 'package:pastebin/models/user.dart';
import 'package:xml/xml.dart';

class PastebinService {
  get apiKey => "54264ef0696e0c17fd50c62d5685e1a8";
  static String? authString;

  Uri getUrl({trailing}) {
    String url = "https://pastebin.com/api";

    if (trailing != null) {
      url += trailing;
    }
    return Uri.parse(url);
  }

  Future<String> login(userName, password) async {
    var response =
        await http.post(this.getUrl(trailing: '/api_login.php'), body: {
      'api_dev_key': this.apiKey,
      'api_user_name': userName,
      'api_user_password': password
    });

    if (response.statusCode == 200) {
      return response.body;
    }

    if (response.statusCode == 401) {
      throw (response.body);
    }

    throw ("Some error occurred");
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

    var response =
        await http.post(this.getUrl(trailing: '/api_post.php'), body: {
      'api_dev_key': this.apiKey,
      'api_option': 'list',
      'api_user_key': authString.toString()
    });

    if (response.statusCode != 200) {
      throw (response.body);
    }

    final bookshelfXml = '<?xml version="1.0"?><data>${response.body}</data>';
    final document = XmlDocument.parse(bookshelfXml);

    document.findAllElements('paste').forEach((element) {
      String pasteKey = getAttr(element, 'paste_key');
      // ignore: unnecessary_null_comparison
      if (pasteKey == null) {
        return;
      }
      PastebinPaste p = new PastebinPaste(
        key: pasteKey,
        size: getAttr(element, 'paste_size'),
        format: getAttr(element, 'paste_format_short'),
        hits: int.tryParse(getAttr(element, 'paste_hits')) ?? 0,
        url: getAttr(element, 'paste_url'),
        isPrivate: getAttr(element, 'paste_private') == 1 ? true : false,
        pasteDate: getAttr(element, 'paste_date'),
        pasteExpiryDate: getAttr(element, 'paste_expire_date'),
        title: getAttr(element, 'paste_title') ?? 'Untitled',
      );
      pastes.add(p);
    });

    return pastes;
  }

  Future<User> getUser(String authString) async {
    var response =
        await http.post(this.getUrl(trailing: '/api_post.php'), body: {
      'api_dev_key': this.apiKey,
      'api_option': 'userdetails',
      'api_user_key': authString
    });

    if (response.statusCode != 200) {
      throw (response.body);
    }

    final bookshelfXml = '<?xml version="1.0"?>${response.body}';
    final document = XmlDocument.parse(bookshelfXml);

    var element = document.findAllElements('user').first;
    User p = new User(
      avatarUrl: getAttr(element, 'user_avatar_url'),
      email: getAttr(element, 'user_email'),
      name: getAttr(element, 'user_name'),
      website: getAttr(element, 'user_website'),
    );

    return p;
  }
}
