import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/custom_choice_chip.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        RoundedContainer(
          padding: const EdgeInsets.all(Sizes.md),
          backgroundColor: dark ? AppColors.darkerGrey : Colors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  SectionHeading(title: 'variation', showActionButton: false),
                  SizedBox(width: Sizes.spaceBetweenItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'Price : ', smallSize: true),
                      Row(
                        children: [
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: Sizes.spaceBetweenItems),
                          ProductPriceText(price: '20'),
                        ],
                      ),

                      Row(
                        children: [
                          ProductTitleText(title: 'Stock : ', smallSize: true),
                          Text(
                            'In stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: Sizes.spaceBetweenItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: Sizes.spaceBetweenItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: 'Green',
                  isSelected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'Red',
                  isSelected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'Blue',
                  isSelected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: Sizes.spaceBetweenItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: 'EU 34',
                  isSelected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'EU 36',
                  isSelected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'EU 38',
                  isSelected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
