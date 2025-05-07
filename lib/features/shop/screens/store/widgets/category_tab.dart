import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/vertical_product.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key , required this.product});

  final VerticalProduct product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              BrandShowCase(
                images: [
                  ImagesStrings.productImage1,
                  ImagesStrings.productImage2,
                  ImagesStrings.productImage3,
                ],
              ),
              BrandShowCase(
                images: [
                  ImagesStrings.productImage1,
                  ImagesStrings.productImage2,
                  ImagesStrings.productImage3,
                ],
              ),
              SizedBox(height: Sizes.spaceBetweenItems),

              SectionHeading(title: 'You might like', onPressed: () {}),
              SizedBox(height: Sizes.spaceBetweenItems),

              GridLayout(
                itemCount: 4,
                itemBuilder: (_, index) {
                  return ProductCardVertical( product: product);
                },
              ),
              SizedBox(height: Sizes.spaceBetweenSections),
            ],
          ),
        ),
      ],
    );
  }
}
