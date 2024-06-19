import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static void save(dynamic key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<dynamic> get(dynamic key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }
}
