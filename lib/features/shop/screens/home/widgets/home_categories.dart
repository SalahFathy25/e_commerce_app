import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../sub_category/sub_categories_screen.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: ImagesStrings.shoeIcon,
            title: 'Shoes',
            onTap:
                () => Get.to(
                  () => const SubCategoriesScreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                ),
          );
        },
      ),
    );
  }
}
