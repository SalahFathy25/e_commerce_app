import 'package:flutter/material.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final isRTL = HelperFunctions.isRTL(context);

    return Column(
      crossAxisAlignment: isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        // Logo
        Image(
          height: 150,
          image: AssetImage(
            dark ? ImagesStrings.lightAppLogo : ImagesStrings.darkAppLogo,
          ),
        ),
        const SizedBox(height: Sizes.spaceBetweenItems),

        // Title
        Text(
          TextStrings.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: isRTL ? TextAlign.right : TextAlign.left,
        ),
        const SizedBox(height: Sizes.sm),

        // Subtitle
        Text(
          TextStrings.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: isRTL ? TextAlign.right : TextAlign.left,
        ),
      ],
    );
  }
}