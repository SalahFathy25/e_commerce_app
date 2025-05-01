import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: const Icon(Iconsax.sort)),
          items:
              ['A to Z', 'Z to A']
                  .map(
                    (option) =>
                        DropdownMenuItem(value: option, child: Text(option)),
                  )
                  .toList(),
          onChanged: (_) {},
        ),
        SizedBox(height: Sizes.spaceBetweenSections),

        /// all products
        GridLayout(
          itemCount: 4,
          itemBuilder: (_, index) => ProductCardVertical(),
        ),
      ],
    );
  }
}
