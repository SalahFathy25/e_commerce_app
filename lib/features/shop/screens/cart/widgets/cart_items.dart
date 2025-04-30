import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_buttons.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: Sizes.spaceBetweenSections),
      itemCount: 2,
      itemBuilder:
          (_, index) => Column(
            children: [
              CartItem(),
              if (showAddRemoveButtons)
                const SizedBox(height: Sizes.spaceBetweenItems),

              if (showAddRemoveButtons)
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
    );
  }
}
