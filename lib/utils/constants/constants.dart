import 'package:supabase_flutter/supabase_flutter.dart';

class Constants {
  static const supabaseUrl = "https://lrfgyfyjfeymqjqwuwhv.supabase.co";
  static const supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxyZmd5ZnlqZmV5bXFqcXd1d2h2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY4MTk1NzYsImV4cCI6MjA2MjM5NTU3Nn0.hwbiIHcLyeydDzrD6bFgQdoPdQZlJTBYC3PGW_6R0xI";
  static final supabase = Supabase.instance.client;
}
