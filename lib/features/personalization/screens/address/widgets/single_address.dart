import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final isRTL = HelperFunctions.isRTL(context);

    return RoundedContainer(
      padding: const EdgeInsets.all(Sizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor:
          selectedAddress
              ? AppColors.primary.withOpacity(0.5)
              : Colors.transparent,
      borderColor:
          selectedAddress
              ? Colors.transparent
              : dark
              ? AppColors.darkerGrey
              : AppColors.grey,
      margin: const EdgeInsets.only(bottom: Sizes.spaceBetweenItems),
      child: Stack(
        children: [
          // Checkmark Icon (RTL-aware positioning)
          Positioned(
            right: isRTL ? null : 5,
            left: isRTL ? 5 : null,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color:
                  selectedAddress
                      ? (dark ? AppColors.white : AppColors.dark)
                      : null,
            ),
          ),

          // Address Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: isRTL ? TextAlign.right : TextAlign.left,
              ),
              const SizedBox(height: Sizes.sm / 2),
              Text(
                '(+1) 123-456-7890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: isRTL ? TextAlign.right : TextAlign.left,
              ),
              const SizedBox(height: Sizes.sm / 2),
              Text(
                '1234 Elm Street, Springfield, IL 62704',
                softWrap: true,
                textAlign: isRTL ? TextAlign.right : TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
