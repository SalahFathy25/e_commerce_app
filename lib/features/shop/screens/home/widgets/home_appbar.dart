import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../../common/widgets/products/products_cart/cart_menu_icon.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text(
            TextStrings.homeAppbarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.apply(color: AppColors.white),
          ),
        ],
      ),
      actions: [CartCounterIcon(iconColor: AppColors.white, onPressed: () {})],
    );
  }
}
