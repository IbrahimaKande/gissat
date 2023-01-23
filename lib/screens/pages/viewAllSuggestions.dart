// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:guissat/screens/pages/suggestionView.dart';
import 'package:guissat/utilities/tvShow/findShow.dart';

class ViewAllSuggestions extends StatelessWidget {
  final String title;
  final String country;
  const ViewAllSuggestions(
      {super.key, required this.title, required this.country});

  @override
  Widget build(BuildContext context) {
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;

    return FutureBuilder<Map<String, String>>(
        future: fetchSuggestions(title, country),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return AlertDialog(
              content: Text("An error has occurred: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData) {
            return const AlertDialog(content: Text("Loading..."));
          } else if (snapshot.data!.keys.toList().isNotEmpty) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(3.0),
              title: Text("Results for $title"),
              content: Container(
                  constraints:
                      const BoxConstraints(minWidth: 500, maxWidth: 500),
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                      padding: const EdgeInsets.all(20.0),
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 10.0,
                      children: snapshot.data!.keys.toList().map((String tit) {
                        // ignore: unnecessary_new
                        return new GridTile(
                            // ignore: unnecessary_new
                            child: GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SuggestionView(
                                title: tit,
                                imageUrl: snapshot.data![tit]!,
                                country: country),
                          ),
                        ));
                      }).toList())),
              actions: [
                IconButton(
                    splashColor: Colors.green,
                    icon: const Icon(
                      Icons.done,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            );
          } else {
            return AlertDialog(
                content: Text(
                    "We couldn't find any result for '$title' in that country 😢"));
          }
        }));
  }
}
