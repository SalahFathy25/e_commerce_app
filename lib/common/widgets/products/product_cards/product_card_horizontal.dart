import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final isRTL = HelperFunctions.isRTL(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.productImageRadius),
        color: dark ? AppColors.darkerGrey : AppColors.softGrey,
      ),
      child: Row(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        children: [
          /// Thumbnail Section
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(Sizes.sm),
            backgroundColor: dark ? AppColors.dark : AppColors.light,
            child: Stack(
              children: [
                // Product Image
                SizedBox(
                  width: 120,
                  height: 120,
                  child: RoundedImage(
                    image: ImagesStrings.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                // Discount Badge
                Positioned(
                  top: 12,
                  left: isRTL ? null : Sizes.sm,
                  right: isRTL ? Sizes.sm : null,
                  child: RoundedContainer(
                    radius: Sizes.sm,
                    backgroundColor: AppColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.sm,
                      vertical: Sizes.xs,
                    ),
                    child: Text(
                      '20%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: AppColors.black),
                    ),
                  ),
                ),

                // Favorite Icon
                Positioned(
                  top: 0,
                  left: isRTL ? 0 : null,
                  right: isRTL ? null : 0,
                  child: CircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          /// Product Details Section
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(
                top: Sizes.sm,
                left: isRTL ? 0 : Sizes.sm,
                right: isRTL ? Sizes.sm : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title and Brand
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'Product Name', smallSize: true),
                      const SizedBox(height: Sizes.spaceBetweenItems / 2),
                      const BrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                  const Spacer(),

                  // Price and Add to Cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: ProductPriceText(price: '120.0')),

                      // Add to Cart Button
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
          ),
        ],
      ),
    );
  }
}
