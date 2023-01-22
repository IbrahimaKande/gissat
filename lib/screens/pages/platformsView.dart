// ignore_for_file: file_names

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guissat/classes/tvShow.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utilities/tvShow/getPlatformsList.dart';

class PlatformsView extends StatelessWidget {
  final TvShow tvShow;
  const PlatformsView({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    var platforms = getPlatformsList(tvShow);
    const logo = {
      'https://tv.apple': "itunes.jpeg",
      "https://play.goo": "gooplay.png",
      "https://www.netf": "netflix.png",
      "https://www.disn": "disney.jpeg",
      "https://www.amaz": "apv.webp",
      "https://watch.am": "apv.webp",
      "https://app.prim": "apv.webp",
    };

    return AlertDialog(
      contentPadding: const EdgeInsets.all(3.0),
      title: Text(
        tvShow.title,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      // ignore: unnecessary_new
      content: SizedBox(
        // Specify some width
        width: MediaQuery.of(context).size.width * .9,
        // ignore: unnecessary_new
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(20.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: platforms.map((String url) {
              // ignore: unnecessary_new
              return new GridTile(
                  // ignore: unnecessary_new
                  child: GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse(url));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "logos/${logo[url.substring(0, 16)]}",
                    fit: BoxFit.cover,
                    width: 12.0,
                    height: 12.0,
                  ),
                ),
              ));
            }).toList()),
      ),
      actions: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(
            tvShow.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
  }
}
