import 'package:e_commerce_app/features/auth/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final ar = HelperFunctions.isArabic(context);
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: ar ? null : Sizes.defaultSpace,
      left: ar ? Sizes.defaultSpace : null,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: Text(
          TextStrings.skip,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: dark ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
