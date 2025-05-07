import 'package:e_commerce_app/features/shop/models/lists/home_categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../sub_category/sub_categories_screen.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: homeCategoriesData.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: homeCategoriesData[index].image,
            title: homeCategoriesData[index].title,
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
