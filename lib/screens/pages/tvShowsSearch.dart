// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:guissat/screens/pages/viewAllSuggestions.dart';
import '../../classes/tvShow.dart';

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

class TvShowSearchPage extends StatefulWidget {
  const TvShowSearchPage({super.key});

  @override
  State<TvShowSearchPage> createState() => _TvShowSearchPageState();
}

class _TvShowSearchPageState extends State<TvShowSearchPage> {
  final textController = TextEditingController();

  String dropdownValue = countries['🇫🇷']!;

  late Future<TvShow> t;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: "Enter your show's title",
            ),
          ),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Color.fromARGB(255, 40, 0, 200)),
          underline: Container(
            height: 2,
            color: const Color.fromARGB(255, 40, 0, 200),
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: countries
              .map((String key, String value) {
                return MapEntry(
                    key,
                    DropdownMenuItem<String>(
                      value: value,
                      child: Text(key),
                    ));
              })
              .values
              .toList(),
        ),
        const SizedBox(height: 15),
        ElevatedButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return ViewAllSuggestions(
                      country: dropdownValue, title: textController.text);
                });
          },
          icon: const Icon(Icons.search),
          label: const Text('Search'),
        ),
      ],
    );
  }
}
