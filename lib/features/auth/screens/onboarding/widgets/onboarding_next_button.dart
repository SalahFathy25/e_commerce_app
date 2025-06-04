import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final ar = HelperFunctions.isArabic(context);
    return Positioned(
      right: ar ? null : Sizes.defaultSpace,
      left: ar ? Sizes.defaultSpace : null,
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? AppColors.primary : Colors.black,
        ),
        child:
            ar
                ? const Icon(Icons.keyboard_arrow_left_rounded, size: 30)
                : const Icon(Icons.keyboard_arrow_right_rounded, size: 30),
      ),
    );
  }
}
