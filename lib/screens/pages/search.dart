import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:guissat/main.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(Icons.music_note),
                label: const Text('SearchMusic'),
              ),
              const SizedBox(width: 40),
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(Icons.live_tv),
                label: const Text('SearchShow'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
