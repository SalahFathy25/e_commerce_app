import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final isRTL = HelperFunctions.isRTL(context);

    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.spaceBetweenItems / 1.5,
        ),
        child: Row(
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          children: [
            // Title
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                textAlign: isRTL ? TextAlign.right : TextAlign.left,
              ),
            ),

            // Value
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                textAlign: isRTL ? TextAlign.right : TextAlign.left,
              ),
            ),

            // Icon
            Expanded(
              child: Icon(isRTL ? Iconsax.arrow_left_34 : icon, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
