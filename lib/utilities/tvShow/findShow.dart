// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../classes/tvShow.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var headers = {
  'X-RapidAPI-Key': '5bcabe5e09msh367059a6bf77a1ep1a3af6jsnd00f2c4c2aa1',
  'X-RapidAPI-Host': 'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com'
};

Future<TvShow> fetchTvShows(title, country) async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup?term=$title&country=$country'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var result = await response.stream.bytesToString();

  return TvShow(title, jsonDecode(result)["results"][0]["picture"], result);
}

Future<Map<String, String>> fetchSuggestions(title, country) async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup?term=$title&country=$country'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var result = await response.stream.bytesToString();

  late Map<String, String> suggs = {};

  for (var i = 0; i < jsonDecode(result)["results"].length; i++) {
    var temp = {
      "${jsonDecode(result)["results"][i]["name"]}":
          "${jsonDecode(result)["results"][i]["picture"]}"
    };
    suggs.addAll(temp);
  }
  return suggs;
}
