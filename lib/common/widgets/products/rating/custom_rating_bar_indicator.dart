import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/app_colors.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  const CustomRatingBarIndicator({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder:
          (_, __) => const Icon(Iconsax.star1, color: AppColors.primary),
      rating: rating,
      itemSize: 20,
      unratedColor: AppColors.grey,
    );
  }
}
