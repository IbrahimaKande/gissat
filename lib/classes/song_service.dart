import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:guissat/classes/deezer_song_model.dart';

class SongService {
  Dio? dio;

  SongService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: 'https://api.deezer.com/track/');
    dio = Dio(options);
  }
  Future<Response<dynamic>?> getTrack(id) async {
    var response = await dio?.get('$id',
        options: Options(headers: {
          'Content-type': 'application/json;charset=UTF-8',
          'Accept': 'application/json;charset=UTF-8',
        }));
    return response;
    /*try {
      final response = await dio?.get('$id',
          options: Options(headers: {
            'Content-type': 'application/json;charset=UTF-8',
            'Accept': 'application/json;charset=UTF-8',
          }));

      //DeezerSongModel result = DeezerSongModel.fromJson(response?.data);
      print(response!);
      return response;
    } on DioError catch (e) {
      if (e.requestOptions != null) {
        throw 'An error has occured';
      } else {
        print(e.error);
        throw e.error;
      }
    }*/
  }
}
