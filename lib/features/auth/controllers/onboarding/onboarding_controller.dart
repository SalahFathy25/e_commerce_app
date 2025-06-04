import 'package:e_commerce_app/features/auth/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/onboarding_list.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //functions
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void dotNavigatorClick(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    if (currentPageIndex.value < onboardingList.length - 1) {
      currentPageIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (currentPageIndex.value == onboardingList.length - 1) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(() => const LoginScreen());
    } else {
      skipPage();
    }
  }

  void skipPage() {
    currentPageIndex.value = onboardingList.length - 1;
    Get.offAll(() => const LoginScreen());
  }
}
