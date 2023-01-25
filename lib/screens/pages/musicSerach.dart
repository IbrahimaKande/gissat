import 'dart:convert';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:guissat/main.dart';
import 'package:guissat/screens/pages/music.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';

class MusicSearchPage extends HookConsumerWidget {
  MusicSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = context.watch<MyAppState>();
    final vm = ref.watch(musicViewModel);

    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tap to search your music',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              AvatarGlow(
                endRadius: 200.0,
                animate: vm.isRecognizing,
                child: GestureDetector(
                  onTap: () => vm.startRecognizing(),
                  child: Material(
                    shape: CircleBorder(),
                    elevation: 8,
                    child: Container(
                      padding: EdgeInsets.all(40),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Image.asset(
                        'assets/logos/logo-2.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(vm.finalSong['title']!),
            Text(vm.finalSong['artist']!),
            Text(vm.finalSong['album']!)
          ],
        )
      ],
    );
  }
}
