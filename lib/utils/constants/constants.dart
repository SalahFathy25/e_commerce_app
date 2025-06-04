import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();
}
