import 'package:e_commerce_app/common/styles/shadow_style.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/product_details/product_details_screen.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final isRTL = HelperFunctions.isRTL(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailsScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(Sizes.productImageRadius),
          color: dark ? AppColors.darkerGrey : AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: RoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                child: Stack(
                  children: [
                    RoundedImage(
                      image: ImagesStrings.productImage1,
                      applyImageRadius: true,
                    ),
                    Positioned(
                      top: 12,
                      left: isRTL ? null : 12,
                      right: isRTL ? 12 : null,
                      child: RoundedContainer(
                        radius: Sizes.sm,
                        backgroundColor: AppColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.sm,
                          vertical: Sizes.xs,
                        ),
                        child: Text(
                          '25%',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.apply(color: AppColors.black),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: isRTL ? 0 : null,
                      right: isRTL ? null : 0,
                      child: CircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Sizes.spaceBetweenItems / 2),
            Padding(
              padding: EdgeInsets.only(
                left: isRTL ? 0 : Sizes.sm,
                right: isRTL ? Sizes.sm : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: 'Product Name', smallSize: true),
                  const SizedBox(height: Sizes.spaceBetweenItems / 2),
                  BrandTitleWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: isRTL ? 0 : Sizes.sm,
                    right: isRTL ? Sizes.sm : 0,
                  ),
                  child: ProductPriceText(price: '60.0'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          isRTL
                              ? Radius.zero
                              : Radius.circular(Sizes.mdCardRadius),
                      topRight:
                          isRTL
                              ? Radius.circular(Sizes.mdCardRadius)
                              : Radius.zero,
                      bottomLeft:
                          isRTL
                              ? Radius.circular(Sizes.productImageRadius)
                              : Radius.zero,
                      bottomRight:
                          isRTL
                              ? Radius.zero
                              : Radius.circular(Sizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: Sizes.lgIcon * 1.2,
                    height: Sizes.lgIcon * 1.2,
                    child: Center(
                      child: Icon(Iconsax.add, color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
