import 'package:e_commerce_app/features/auth/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../models/onboarding_list.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    final ar = HelperFunctions.isArabic(context);
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
      left: ar ? null : Sizes.defaultSpace,
      right: ar ? Sizes.defaultSpace : null,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigatorClick,
        count: onboardingList.length,
        effect: ExpandingDotsEffect(
          dotHeight: 6,
          activeDotColor: dark ? AppColors.light : AppColors.dark,
          dotColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        ),
      ),
    );
  }
}
