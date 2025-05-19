import 'package:e_commerce_app/data/services/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/onboarding_list.dart';

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
      Get.offAll(() => const AuthGate());
    } else {
      skipPage();
    }
  }

  void skipPage() {
    currentPageIndex.value = onboardingList.length - 1;
    Get.offAll(() => const AuthGate());
  }
}
