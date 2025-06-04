import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.defaultSpace,
        vertical: Sizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Sizes.lgCardRadius),
          topRight: Radius.circular(Sizes.lgCardRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: AppColors.darkGrey,
                width: 40,
                height: 40,
                color: AppColors.white,
              ),
              const SizedBox(width: Sizes.spaceBetweenItems),
              Text('1', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: Sizes.spaceBetweenItems),
              const CircularIcon(
                icon: Iconsax.add,
                backgroundColor: AppColors.black,
                width: 40,
                height: 40,
                color: AppColors.white,
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(Sizes.md),
              backgroundColor: AppColors.black,
              side: const BorderSide(color: AppColors.black),
            ),
            child: const Row(
              children: [
                Icon(Iconsax.shopping_bag, size: 18),
                SizedBox(width: Sizes.sm),
                Text('Add to Bag'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
