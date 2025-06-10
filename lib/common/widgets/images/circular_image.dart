import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = Sizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? AppColors.dark : AppColors.light),
        borderRadius: BorderRadius.circular(100),
      ),
      child:
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Center(
              child: isNetworkImage
                  ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const ShimmerEffect(width: 55, height: 55),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                  : Image(image: AssetImage(image), color: overlayColor, fit: fit),
            ),
          ),
    );
  }
}
