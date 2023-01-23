// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../utilities/tvShow/saveShow.dart';
import '../../utilities/tvShow/viewTvShow.dart';

class SuggestionView extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String country;
  const SuggestionView(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.country});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              saveShow(title, country);
              return viewTvShow(title, country);
            });
      },
      child: Column(
        children: [
          Text(title),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(imageUrl, fit: BoxFit.fill),
          )
        ],
      ),
    );
  }
}
