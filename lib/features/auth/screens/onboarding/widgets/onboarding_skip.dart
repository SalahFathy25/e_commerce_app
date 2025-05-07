import 'package:e_commerce_app/features/auth/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/language&theme/change_language_button.dart';

import '../../../../../common/widgets/language&theme/change_theme_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    // final ar = HelperFunctions.isArabic(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      left: 0,
      right: 0,
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ChangeThemeButton(),
                // const SizedBox(width: 8),
                // ChangeLanguageButton(),
              ],
            ),
            TextButton(
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
          ],
        ),
      ),
    );
  }
}
