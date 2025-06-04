import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/all_brands/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const SectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: Sizes.spaceBetweenItems),

              GridLayout(
                itemCount: 12,
                mainAxisExtent: 80,
                itemBuilder:
                    (context, index) => BrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => const BrandProducts()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
