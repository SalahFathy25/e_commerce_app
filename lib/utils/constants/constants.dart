import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Constants {
  static final supabase = Supabase.instance.client;
  static const supabaseUrl = 'https://jkhbimtxvomwkjwrefiy.supabase.co/rest/v1/';
  static const supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpraGJpbXR4dm9td2tqd3JlZml5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzcxMDQ1MjgsImV4cCI6MjA5MjY4MDUyOH0.4sm1sqJOKl3EOb2j2LDQSXCRwl-HNrMJYKexsG0D8uY';
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();
}
