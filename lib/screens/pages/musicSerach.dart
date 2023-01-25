import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:guissat/main.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class MusicSearchPage extends StatelessWidget {
  MusicSearchPage({super.key});

  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  /*Future initRecorder() async {
    //final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Permission not granted';
    }

    await recorder.openRecorder();
    isRecorderReady = true;
  }

  Future stop() async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print('Record : $audioFile');
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }*/

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
            ],
          ),
        ],
      ),
    );
  }
}
