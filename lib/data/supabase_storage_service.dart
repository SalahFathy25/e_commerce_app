import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/constants/constants.dart';

class SupabaseStorageService extends GetxController {
  static SupabaseStorageService get instance => Get.find();

  final _supabaseStorage = Constants.supabase.storage;

  // Upload Local Assets from IDE
  // Returns a Uint8List containing image data.
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
      return imageData;
    } catch (e) {
      throw 'Error loading image from assets: $e';
    }
  }


  // Upload Image using ImageData on Cloud Supabase Storage
  // Returns the download URL of the uploaded image
  Future<String> uploadImageData(String bucket, Uint8List image, String name) async {
    try {
      await _supabaseStorage.from(bucket).uploadBinary(
        name,
        image,
        fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
      );
      final String url = _supabaseStorage.from(bucket).getPublicUrl(name);
      return url;
    } catch (e) {
      throw 'Something went wrong while uploading image: $e';
    }
  }
}
