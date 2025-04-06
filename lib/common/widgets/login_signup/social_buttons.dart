import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(ImagesStrings.googleLogo),
              width: Sizes.mdIcon,
              height: Sizes.mdIcon,
            ),
          ),
        ),
        SizedBox(width: Sizes.spaceBetweenItems * 2),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(ImagesStrings.facebookLogo),
              width: Sizes.mdIcon,
              height: Sizes.mdIcon,
            ),
          ),
        ),
      ],
    );
  }
}
