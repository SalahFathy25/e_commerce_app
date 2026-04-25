import 'package:e_commerce_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {
  // 1. Ensure widgets are initialized
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize GetStorage
  await GetStorage.init();

  // 3. Preserve Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 4. Initialize Supabase
  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnonKey,
  );

  // 5. Put Authentication Repository
  Get.put(AuthenticationRepository());

  // 6. Run App
  runApp(const App());
}
