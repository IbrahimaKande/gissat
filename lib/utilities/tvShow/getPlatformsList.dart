// ignore: file_names
import 'dart:convert';

import 'package:guissat/classes/tvShow.dart';

List<String> getPlatformsList(TvShow tvShow) {
  var res = <String>[];
  for (var i = 0;
      i < jsonDecode(tvShow.platforms)["results"][0]["locations"].length;
      i++) {
    res.add(jsonDecode(tvShow.platforms)["results"][0]["locations"][i]["url"]);
  }
  return res;
}
