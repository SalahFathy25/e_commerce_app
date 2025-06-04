import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../models/vertical_product.dart';
import '../checkout/checkout_screen.dart';
import '../product_reviews/product_review_screen.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final VerticalProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.defaultSpace,
                left: Sizes.defaultSpace,
                bottom: Sizes.defaultSpace,
              ),
              child: Column(
                children: [
                  RatingAndShare(
                    rating: product.rating,
                    reviewCount: product.reviewCount,
                  ),

                  const ProductMetaData(),

                  if (product.sizes != null || product.colors != null)
                    const ProductAttributes(),
                  const SizedBox(height: Sizes.spaceBetweenSections),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          () => Get.to(
                            () => const CheckoutScreen(),
                            transition: Transition.rightToLeft,
                          ),
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: Sizes.spaceBetweenSections),

                  const SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: Sizes.spaceBetweenItems),
                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const Divider(),
                  const SizedBox(height: Sizes.spaceBetweenItems),
                  Row(
                    children: [
                      SectionHeading(
                        title: 'Reviews(${product.reviewCount})',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed:
                            () => Get.to(
                              () => const ProductReviewScreen(),
                              transition: Transition.rightToLeft,
                            ),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.spaceBetweenSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
