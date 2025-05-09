import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../auth/screens/login/login_screen.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    CircularImage(
                      image: ImagesStrings.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(TextStrings.changePicture),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Sizes.spaceBetweenItems / 2),
              Divider(),
              SizedBox(height: Sizes.spaceBetweenItems),
              SectionHeading(
                title: TextStrings.profileInformation,
                showActionButton: false,
              ),
              SizedBox(height: Sizes.spaceBetweenItems),

              ProfileMenu(
                title: TextStrings.name,
                value: 'Salah Fathy',
                onPressed: () {},
              ),
              ProfileMenu(
                title: TextStrings.username,
                value: 'salah_fathy',
                onPressed: () {},
              ),

              SizedBox(height: Sizes.spaceBetweenItems),
              Divider(),
              SizedBox(height: Sizes.spaceBetweenItems),
              SectionHeading(
                title: TextStrings.personalInformation,
                showActionButton: false,
              ),
              SizedBox(height: Sizes.spaceBetweenItems),

              ProfileMenu(
                title: TextStrings.userId,
                value: '12345',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              ProfileMenu(
                title: TextStrings.email,
                value: 'salah_fathy',
                onPressed: () {},
              ),
              ProfileMenu(
                title: TextStrings.phoneNo,
                value: '+20123456789',
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

              Divider(),
              SizedBox(height: Sizes.spaceBetweenItems),

              Center(
                child: TextButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: Text(
                    TextStrings.logOut,
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
