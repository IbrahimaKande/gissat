// ignore: file_names
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    show FlutterSecureStorage;

Future<void> saveShow(String title, String country) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  if (await storage.read(key: title) != country) {
    await storage.write(key: title, value: country);
  }
}
