import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';
import '../../models/onboarding_list.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            physics: const BouncingScrollPhysics(),
            itemCount: onboardingList.length,
            itemBuilder:
                (context, index) =>
                    OnBoardingPage(onboardingModel: onboardingList[index]),
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
