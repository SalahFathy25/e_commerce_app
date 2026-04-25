import 'package:e_commerce_app/utils/constants/constants.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/category_model.dart';
import '../../supabase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _supabase = Constants.supabase;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final List<dynamic> data = await _supabase.from('categories').select();
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching categories: $e';
    }
  }

  // Upload Categories to the Cloud (Dummy Data)
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(SupabaseStorageService());

      for (var category in categories) {
        // Upload image if it's a local path
        if (!category.image.startsWith('http')) {
          final data = await storage.getImageDataFromAssets(category.image);
          final fileName = '${category.name.replaceAll(' ', '_')}.jpg';
          final url = await storage.uploadImageData('categories', data, fileName);
          category.image = url;
        }

        // Upsert to categories table
        await _supabase.from('categories').upsert(category.toJson());
      }
    } catch (e) {
      throw 'Error uploading dummy data: $e';
    }
  }
}
