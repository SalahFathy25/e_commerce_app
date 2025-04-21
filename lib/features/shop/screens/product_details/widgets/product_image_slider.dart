import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          // Main Large Image
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(ImagesStrings.productImage1)),
                ),
              ),
            ),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: Sizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: Sizes.spaceBetweenItems);
                  },
                  itemBuilder: (context, index) {
                    return RoundedImage(
                      width: 80,
                      backgroundColor: dark ? AppColors.dark : AppColors.white,
                      border: Border.all(color: AppColors.primary),
                      padding: const EdgeInsets.all(Sizes.sm),
                      image: ImagesStrings.productImage10,
                    );
                  },
                ),
              ),
            ),

            // AppBar Icons
            CustomAppbar(
              showBackArrow: true,
              actions: [CircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
