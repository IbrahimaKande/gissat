import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guissat/main.dart';
import 'package:provider/provider.dart';
import '../../classes/tvShow.dart';
import '../../utilities/findShow.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<String> countries = <String>[
  'fr',
  'uk',
  'us',
  'ar',
  'at',
  'be',
  'br',
  'ca',
  'de',
  'es',
  'ie',
  'id',
  'it',
  'is',
  'kr',
  'my',
  'mx',
  'no',
  'nl',
  'pt',
  'se',
  'sg'
];

class TvShowSearchPage extends StatelessWidget {
  final textController = TextEditingController();
  String dropdownValue = countries.first;
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
            color: Color.fromARGB(255, 40, 0, 200),
          ),
          onChanged: (String? value) {
            dropdownValue = value!;
          },
          items: countries.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
        ElevatedButton.icon(
          onPressed: () {
            t = fetchTvShows(textController.text, dropdownValue).then((result) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return FutureBuilder<TvShow>(
                        future: t,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            String tit = snapshot.data!.title;
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          return AlertDialog(
                              title: Text(snapshot.data!.title),
                              actions: <Widget>[
                                Image.network(snapshot.data!.imageUrl),
                                /*CustomScrollView(
                                  slivers: <Widget>[
                                    SliverGrid(
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200.0,
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,
                                        childAspectRatio: 4.0,
                                      ),
                                      delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          return Container(
                                            alignment: Alignment.center,
                                            color:
                                                Colors.teal[100 * (index % 9)],
                                            child: Text('Grid Item $index'),
                                          );
                                        },
                                        childCount: 20,
                                      ),
                                    ),
                                    SliverFixedExtentList(
                                      itemExtent: 50.0,
                                      delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          return Container(
                                            alignment: Alignment.center,
                                            color: Colors
                                                .lightBlue[100 * (index % 9)],
                                            child: Text('List Item $index'),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                    padding: const EdgeInsets.all(8),
                                    itemCount:
                                        jsonDecode(snapshot.data!.platforms)[
                                                "results"][0]["locations"]
                                            .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                          height: 50,
                                          child: Center(
                                            child: Text(jsonDecode(snapshot
                                                        .data!.platforms)[
                                                    "results"][0]["locations"]
                                                [index]["display_name"]),
                                          ));
                                    }),*/
                                TextButton(
                                  onPressed: () {
                                    print("okay clicked");
                                  },
                                  child: Container(
                                    color: Colors.green,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("okay"),
                                  ),
                                ),
                              ]);
                        });
                  });
              //print(result.imageUrl);
              return result;
            });
            /*showDialog(
              context: context,
              builder: (context) {
                return FutureBuilder<TvShow>(
                    future: t,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        String tit = snapshot.data!.title;
                        Future<String> imageUrl = snapshot.data!.imageUrl;
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return AlertDialog(
                        content: Text(snapshot.data!.imageUrl),
                      );
                    });
              },
            );*/
          },
          icon: Icon(Icons.search),
          label: const Text('Search'),
        ),
      ],
    );
  }
}

// store done, now display the call result first then the historic
//silvergrid added now make it work