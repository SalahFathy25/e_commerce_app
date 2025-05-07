import 'package:e_commerce_app/features/personalization/screens/settings/settings_screen.dart';
import 'package:e_commerce_app/features/shop/models/lists/vertical_products_data.dart';
import 'package:e_commerce_app/features/shop/screens/home/home_screen.dart';
import 'package:e_commerce_app/features/shop/screens/store/store_screen.dart';
import 'package:e_commerce_app/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/models/vertical_product.dart';
import 'utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = verticalProductsData;
    final controller = Get.put(NavigationController(productData[0]));
    final darkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: darkMode ? AppColors.black : Colors.white,
          indicatorColor:
              darkMode
                  ? AppColors.white.withOpacity(0.1)
                  : AppColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:
              (int index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  late VerticalProduct product;

  final Rx<int> selectedIndex = 0.obs;
  late final List<Widget> screens;

  NavigationController(this.product);

  @override
  void onInit() {
    super.onInit();
    screens = [
      HomeScreen(product: product),
      StoreScreen(product: product),
      WishlistScreen(product: product),
      SettingsScreen(),
    ];
  }
}
