import 'package:supabase_flutter/supabase_flutter.dart';

class Constants {
  static const supabaseUrl = "https://qakmymrmhpxcrkbpfiol.supabase.co";
  static const supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFha215bXJtaHB4Y3JrYnBmaW9sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc5MDUzNDksImV4cCI6MjA2MzQ4MTM0OX0.MFxFH5zyyCLTZ3v5V5NB_urp1EgXhSD1zZJa_Jil_24";
  static final supabase = Supabase.instance.client;
}
