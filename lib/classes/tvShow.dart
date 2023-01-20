import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class TvShow {
  late String title;
  late String imageUrl;
  late String platforms;

  TvShow(String title, String imageUrl, String platforms) {
    this.title = title;
    this.imageUrl = imageUrl;
    this.platforms = platforms;
  }

  getTitle(TvShow t) {
    return t.title;
  }

  save(TvShow t, String platforms) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(t.title, platforms);
  }

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
