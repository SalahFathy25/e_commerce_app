import 'package:flutter/material.dart';
import 'brand_card.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final isRTL = HelperFunctions.isRTL(context);

    return RoundedContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: Sizes.spaceBetweenItems),
      padding: const EdgeInsets.all(Sizes.md),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          const SizedBox(height: Sizes.spaceBetweenItems),

          Row(
            textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
            children:
                images.asMap().entries.map((entry) {
                  return brandTopProductImageWidget(
                    entry.value,
                    context,
                    dark,
                    isLast: entry.key == images.length - 1,
                    isRTL: isRTL,
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(
    String image,
    BuildContext context,
    bool dark, {
    required bool isLast,
    required bool isRTL,
  }) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
        margin: EdgeInsetsDirectional.only(
          end: isLast ? 0 : Sizes.sm,
        ).resolve(TextDirection.ltr),
        padding: const EdgeInsets.all(Sizes.md),
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
