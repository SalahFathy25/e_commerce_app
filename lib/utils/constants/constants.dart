import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Constants {
  static final supabase = Supabase.instance.client;
  static const supabaseUrl = 'https://jkhbimtxvomwkjwrefiy.supabase.co';
  static const supabaseAnonKey =
      'sb_publishable_V8IjqJxvcewWDQwbk4SJzQ_KD2LeS5T';
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();
}
