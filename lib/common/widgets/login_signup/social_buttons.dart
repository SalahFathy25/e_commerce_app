import 'package:e_commerce_app/features/auth/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
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
            icon: const Image(
              image: AssetImage(ImagesStrings.google),
              width: Sizes.mdIcon,
              height: Sizes.mdIcon,
            ),
          ),
        ),
        const SizedBox(width: Sizes.spaceBetweenItems * 2),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(ImagesStrings.facebook),
              width: Sizes.mdIcon,
              height: Sizes.mdIcon,
            ),
          ),
        ),
      ],
    );
  }
}
