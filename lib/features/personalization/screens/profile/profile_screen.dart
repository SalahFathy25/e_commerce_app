import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/shimmers/shimmer_effect.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';
import 'change_name_screen.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(TextStrings.profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty
                              ? networkImage
                              : ImagesStrings.user;

                      return controller.imageUploading.value
                          ? const ShimmerEffect(
                            width: 80,
                            height: 80,
                            radius: 80,
                          )
                          : CircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: Text(TextStrings.changePicture),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: Sizes.spaceBetweenItems / 2),
              const Divider(),
              const SizedBox(height: Sizes.spaceBetweenItems),
              SectionHeading(
                title: TextStrings.profileInformation,
                showActionButton: false,
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),

              ProfileMenu(
                title: TextStrings.name,
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeNameScreen()),
              ),
              ProfileMenu(
                title: TextStrings.username,
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(height: Sizes.spaceBetweenItems),
              const Divider(),
              const SizedBox(height: Sizes.spaceBetweenItems),
              SectionHeading(
                title: TextStrings.personalInformation,
                showActionButton: false,
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),

              ProfileMenu(
                title: TextStrings.userId,
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              ProfileMenu(
                title: TextStrings.email,
                value: controller.user.value.email,
                onPressed: () {},
              ),
              ProfileMenu(
                title: TextStrings.phoneNo,
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              ProfileMenu(
                title: TextStrings.gender,
                value: TextStrings.male,
                onPressed: () {},
              ),
              ProfileMenu(
                title: TextStrings.dateOfBirth,
                value: '01 Oct, 2000',
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(height: Sizes.spaceBetweenItems),

              Center(
                child: TextButton(
                  onPressed: () async => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
