import 'package:flutter/material.dart';
import 'package:guissat/utilities/tvShow/saveShow.dart';
import 'package:guissat/utilities/tvShow/viewTvShow.dart';
import '../../classes/tvShow.dart';
import '../../utilities/tvShow/findShow.dart';
import '../pages/platformsView.dart';

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
  TvShowSearchPage({super.key});

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
                  saveShow(textController.text, dropdownValue);
                  return viewTvShow(textController.text, dropdownValue);
                });
          },
          icon: const Icon(Icons.search),
          label: const Text('Search'),
        ),
      ],
    );
  }
}
