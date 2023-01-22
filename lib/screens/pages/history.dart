import 'dart:js';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:guissat/main.dart';
import 'package:guissat/screens/pages/platformsView.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../classes/tvShow.dart';
import '../../utilities/tvShow/findShow.dart';
import '../../utilities/tvShow/viewTvShow.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    const countries = {
      "🇫🇷": "fr",
      "🇬🇧": "uk",
      "🇺🇸": "us",
      "🇦🇲": "ar",
      "🇧🇪": "be",
      "🇨🇦": "na",
      "🇩🇰": "de",
      "🇪🇸": "es",
      "🇮🇹": "it",
      "🇮🇱": "is",
      "🇳🇴": "no",
      "🇳🇱": "nl",
      "🇵🇹": "pt",
    };

    return FutureBuilder<Map<String, String>>(
      future: loadResearches(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.keys.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                    type: MaterialType.card,
                    child: ListTile(
                      onTap: () => {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return viewTvShow(
                                  snapshot.data!.keys.toList()[index],
                                  snapshot.data!.values.toList()[index]);
                            })
                      },
                      tileColor: Colors.blue.shade50,
                      focusColor: Colors.blue.shade100,
                      title: Text(snapshot.data!.keys.toList()[index]),
                      trailing: Text(countries.keys.firstWhere((element) =>
                          countries[element] ==
                          snapshot.data!.values.toList()[index])),
                    ));
              });
        } else {
          return const Text("An error has occurred}");
        }
      },
    );
  }
}

Future<Map<String, String>> loadResearches() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  return await storage.readAll();
}
