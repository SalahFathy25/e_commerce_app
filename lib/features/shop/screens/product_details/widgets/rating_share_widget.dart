import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: Sizes.spaceBetweenItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$rating',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(text: '($reviewCount)'),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share, size: Sizes.mdIcon),
        ),
      ],
    );
  }
}
