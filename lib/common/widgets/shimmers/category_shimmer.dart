import 'package:e_commerce_app/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder:
            (_, __) => const SizedBox(width: Sizes.spaceBetweenItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: Sizes.spaceBetweenItems / 2),

              // Text
              ShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
