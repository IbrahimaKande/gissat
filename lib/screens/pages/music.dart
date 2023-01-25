import 'dart:convert';

import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/material.dart';
import 'package:guissat/classes/deezer_song_model.dart';
import 'package:guissat/classes/song_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MusicViewModel extends ChangeNotifier {
  MusicViewModel() {
    initAcr();
  }
  final AcrCloudSdk acr = AcrCloudSdk();
  final songService = SongService();
  DeezerSongModel? currentSong;
  bool isRecognizing = false;
  bool success = false;
  late Map<String, String> finalSong;

  Future<void> initAcr() async {
    try {
      acr
        ..init(
          host: 'identify-eu-west-1.acrcloud.com', // https://www.acrcloud.com/
          accessKey: '46312b832f6399519184c5dc869fd239',
          accessSecret: 'mmvQ7pmE6veKoFu67F9waVJbNfLE9GY3ikXJeBLQ',
          setLog: true,
        )
        ..songModelStream.listen(searchSong);
    } catch (e) {
      print(e.toString());
    }
  }

  void searchSong(SongModel song) async {
    print(song.metadata!.music![0].title);
    final metadata = song.metadata;
    if (metadata != null && metadata.music!.isNotEmpty) {
      finalSong = {
        "title": metadata.music![0].title!,
        "artist": metadata.music![0].artists![0].name!,
        "album": metadata.music![0].album!.name!,
      };
      success = true;
      notifyListeners();
      /*final trackId = metadata.music![0].externalMetadata?.deezer?.track?.id;
      await songService.getTrack(trackId).then((value) => {
            success = true,
            notifyListeners(),
            finalSong = value!.data,
          });*/
      /*try {
        final res = await songService.getTrack(trackId);
        currentSong = res;
        success = true;
        notifyListeners();
        print(song);
      } catch (e) {
        isRecognizing = false;
        success = false;
        notifyListeners();
        print("catch here");
      }*/
    }
  }

  Future<void> startRecognizing() async {
    isRecognizing = true;
    success = false;
    notifyListeners();
    try {
      print("try startrecognizing");
      await acr.start();
    } catch (e) {
      print(' catch start recognizing fail ');
    }
  }

  Future<void> stopRecognizing() async {
    isRecognizing = false;
    success = false;
    notifyListeners();
    try {
      await acr.stop();
    } catch (e) {
      print(e.toString());
    }
  }
}

final musicViewModel = ChangeNotifierProvider<MusicViewModel>((ref) {
  print('>>> In musicViewModel');
  return MusicViewModel();
});
