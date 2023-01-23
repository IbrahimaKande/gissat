// ignore: file_names
import 'dart:convert';
import 'dart:js';
import 'package:http/http.dart' as http;
import '../../classes/tvShow.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var headers = {
  'X-RapidAPI-Key': dotenv.env['X-RapidAPI-Key'] ?? '',
  'X-RapidAPI-Host': dotenv.env['X-RapidAPI-Host'] ?? ''
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
