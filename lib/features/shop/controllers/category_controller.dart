import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // Load categories data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;
      // Fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();
      // Update the categories list
      allCategories.assignAll(categories);
      // Filter featured categories
      featuredCategories.assignAll(
        categories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  // Load selected categories data
  // Get Category or Sub-Category Products
}
