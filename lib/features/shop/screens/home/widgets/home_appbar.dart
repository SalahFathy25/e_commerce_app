import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../common/widgets/shimmers/shimmer_effect.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextStrings.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: AppColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const ShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.apply(color: AppColors.white),
              );
            }
          }),
        ],
      ),
      actions: [CartCounterIcon(iconColor: AppColors.white, onPressed: () {})],
    );
  }
}
