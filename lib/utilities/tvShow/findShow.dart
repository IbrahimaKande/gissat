import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../classes/tvShow.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<TvShow> fetchTvShows(title, country) async {
  var headers = {
    'X-RapidAPI-Key': dotenv.env['X-RapidAPI-Key'] ?? '',
    'X-RapidAPI-Host': dotenv.env['X-RapidAPI-Host'] ?? ''
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup?term=$title&country=$country'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var result = await response.stream.bytesToString();

  return TvShow(title, jsonDecode(result)["results"][0]["picture"], result);
}
