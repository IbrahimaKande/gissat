import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guissat/classes/tvShow.dart';

Future<void> saveShow(TvShow show) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  await storage.write(key: show.title, value: show.platforms);
}
