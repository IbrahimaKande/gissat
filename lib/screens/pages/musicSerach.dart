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

    if (vm.success) {
      return Scaffold(
        backgroundColor: Color(0xFF042442),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(vm.currentSong?.title ?? '',
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vm.currentSong?.artist?.name ?? '',
                          style: TextStyle(color: Colors.white, fontSize: 15))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
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
                      'logos/logo-2.png',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
