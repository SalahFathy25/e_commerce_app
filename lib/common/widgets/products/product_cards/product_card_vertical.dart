import 'package:e_commerce_app/common/styles/shadow_style.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/models/vertical_product.dart';
import '../../../../features/shop/screens/product_details/product_details_screen.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final VerticalProduct product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final isRTL = HelperFunctions.isRTL(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
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
            /// Thumbnail with Badge and Favorite
            Center(
              child: RoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(Sizes.sm),
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                child: Stack(
                  children: [
                    /// Product Image
                    RoundedImage(
                      image: product.imageUrl,
                      applyImageRadius: true,
                    ),

                    /// Discount Tag
                    if (product.hasDiscount)
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
                            '${product.discountPercent?.round()}%',
                            style: Theme.of(context).textTheme.labelLarge!
                                .apply(color: AppColors.black),
                          ),
                        ),
                      ),

                    /// Favorite Button
                    Positioned(
                      top: 0,
                      left: isRTL ? 0 : null,
                      right: isRTL ? null : 0,
                      child: CircularIcon(
                        icon:
                            product.isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        color:
                            product.isFavorite
                                ? Colors.red
                                : AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Sizes.spaceBetweenItems / 2),

            /// Product Details
            Padding(
              padding: EdgeInsets.only(
                left: isRTL ? 0 : Sizes.sm,
                right: isRTL ? Sizes.sm : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: Sizes.spaceBetweenItems / 2),
                  BrandTitleWithVerifiedIcon(title: product.brand),
                ],
              ),
            ),

            const Spacer(),

            /// Price & Add to Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Padding(
                  padding: EdgeInsets.only(
                    left: isRTL ? 0 : Sizes.sm,
                    right: isRTL ? Sizes.sm : 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.hasDiscount)
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.labelMedium?.apply(
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ProductPriceText(
                        price:
                            product.hasDiscount
                                ? product.discountedPrice.toStringAsFixed(2)
                                : product.price.toStringAsFixed(2),
                        isLarge: !product.hasDiscount,
                      ),
                    ],
                  ),
                ),

                /// Add to Cart Button
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
