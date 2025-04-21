import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/product_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - product image slider
            ProductImageSlider(),
            // 2 - product details
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.defaultSpace,
                left: Sizes.defaultSpace,
                bottom: Sizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Rating & share button
                  RatingAndShare(),
                  // price, title, stack & brand
                  ProductMetaData(),
                  // attributes
                  // checkout button
                  // description
                  // reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
