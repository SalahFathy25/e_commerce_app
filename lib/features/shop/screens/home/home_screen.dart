import 'package:e_commerce_app/features/shop/screens/all_products/all_products_screen.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/custom_search_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../models/lists/vertical_products_data.dart';
import '../../models/vertical_product.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.product});

  final VerticalProduct product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  const SizedBox(height: Sizes.spaceBetweenSections),
                  CustomSearchContainer(text: TextStrings.searchInStore),
                  const SizedBox(height: Sizes.spaceBetweenSections),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.defaultSpace,
                      right: Sizes.defaultSpace / 2,
                    ),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: TextStrings.popularCategories,
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: Sizes.spaceBetweenItems),
                        HomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: Sizes.spaceBetweenSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  PromoSlider(
                    banners: [
                      ImagesStrings.promoBanner1,
                      ImagesStrings.promoBanner2,
                      ImagesStrings.promoBanner3,
                    ],
                  ),
                  SizedBox(height: Sizes.spaceBetweenSections),
                  SectionHeading(
                    title: TextStrings.popularProducts,
                    onPressed:
                        () => Get.to(
                          () =>
                              AllProductsScreen(product: product),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                        ),
                  ),
                  GridLayout(
                    itemCount: verticalProductsData.length,
                    itemBuilder:
                        (context, index) => ProductCardVertical(
                          product: verticalProductsData[index],
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
