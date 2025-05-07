import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/all_brands/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../models/vertical_product.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key, required this.product});

  final VerticalProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              SectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: Sizes.spaceBetweenItems),

              GridLayout(
                itemCount: 12,
                mainAxisExtent: 80,
                itemBuilder:
                    (context, index) => BrandCard(
                      showBorder: true,
                      onTap:
                          () => Get.to(() => BrandProducts(product: product)),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
