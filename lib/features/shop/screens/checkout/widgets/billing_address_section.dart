import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          '123 Main St, Springfield',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: Sizes.spaceBetweenItems / 2),

        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: Sizes.spaceBetweenItems),
            Text(
              '+1 234 567 890',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(width: Sizes.spaceBetweenItems / 2),

        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: Sizes.spaceBetweenItems),
            Text(
              '123 Main St, Springfield',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(width: Sizes.spaceBetweenItems / 2),
      ],
    );
  }
}
