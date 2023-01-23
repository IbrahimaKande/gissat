// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../classes/tvShow.dart';
import '../../screens/pages/platformsView.dart';
import 'findShow.dart';

Widget viewTvShow(String title, String country) {
  return FutureBuilder<TvShow>(
      future: fetchTvShows(title, country),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PlatformsView(
            tvShow: snapshot.data!,
          );
        } else if (!snapshot.hasData) {
          return const AlertDialog(
            content: Text("Loading..."),
          );
        } else if (snapshot.hasError) {
          return AlertDialog(
            content: Text("An error occurred : ${snapshot.error}"),
          );
        } else {
          return AlertDialog(
            content: Text(
                "We couldn't find any result for '$title' in that country 😢"),
          );
        }
      });
}
