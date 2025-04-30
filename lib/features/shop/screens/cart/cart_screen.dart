import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/add_remove_buttons.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder:
              (_, __) => SizedBox(height: Sizes.spaceBetweenSections),
          itemCount: 4,
          itemBuilder:
              (_, index) => Column(
                children: [
                  CartItem(),
                  const SizedBox(height: Sizes.spaceBetweenItems),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 70),
                          ProductQuantityWithAddRemoveButton(),
                        ],
                      ),
                      ProductPriceText(price: '256'),
                    ],
                  ),
                ],
              ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
