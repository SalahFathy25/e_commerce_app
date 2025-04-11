import 'package:flutter/material.dart';

import 'brand_card.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: Sizes.spaceBetweenItems),
      padding: EdgeInsets.all(Sizes.md),
      child: Column(
        children: [
          BrandCard(showBorder: false),
          SizedBox(height: Sizes.spaceBetweenItems),

          Row(
            children:
                images.map((image) {
                  return brandTopProductImageWidget(image, context, dark);
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context, bool dark) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
        margin: EdgeInsets.only(right: Sizes.sm),
        padding: EdgeInsets.all(Sizes.md),
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
