import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/rating/custom_rating_bar_indicator.dart';
import 'widgets/overall_product_rating.dart';
import 'widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rating and Reviews are very important for us to improve our products and services.',
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),

              // Overall Product Ratings
              const OverallProductRating(),
              const CustomRatingBarIndicator(rating: 3.5),
              Text('12,666', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: Sizes.spaceBetweenSections),

              // User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
