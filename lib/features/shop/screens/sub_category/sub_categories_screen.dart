import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const RoundedImage(
                image: ImagesStrings.promoBanner1,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),

              /// Sub Categories
              Column(
                children: [
                  SectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: Sizes.spaceBetweenItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:
                          (context, index) =>
                              const SizedBox(width: Sizes.spaceBetweenItems),
                      itemBuilder: (context, index) => const ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),

              /// Sub Categories
              Column(
                children: [
                  SectionHeading(title: 'Sports Accessories', onPressed: () {}),
                  const SizedBox(height: Sizes.spaceBetweenItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:
                          (context, index) =>
                              const SizedBox(width: Sizes.spaceBetweenItems),
                      itemBuilder: (context, index) => const ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),

              /// Sub Categories
              Column(
                children: [
                  SectionHeading(title: 'Sports Shoes', onPressed: () {}),
                  const SizedBox(height: Sizes.spaceBetweenItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:
                          (context, index) =>
                              const SizedBox(width: Sizes.spaceBetweenItems),
                      itemBuilder: (context, index) => const ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
