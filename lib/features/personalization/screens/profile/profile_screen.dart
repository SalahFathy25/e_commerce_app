import 'package:e_commerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(showBackArrow: true, title: Text('Profile')),
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
                      child: Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Sizes.spaceBetweenItems / 2),
              Divider(),
              SizedBox(height: Sizes.spaceBetweenItems),
              SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              SizedBox(height: Sizes.spaceBetweenItems),

              ProfileMenu(
                title: 'Name',
                value: 'Salah Fathy',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Username',
                value: 'salah_fathy',
                onPressed: () {},
              ),

              SizedBox(height: Sizes.spaceBetweenItems),
              Divider(),
              SizedBox(height: Sizes.spaceBetweenItems),
              SectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              SizedBox(height: Sizes.spaceBetweenItems),

              ProfileMenu(
                title: 'User ID',
                value: '12345',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Email',
                value: 'salah_fathy',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: '+20123456789',
                onPressed: () {},
              ),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileMenu(
                title: 'Date of Birth',
                value: '01 Oct, 2000',
                onPressed: () {},
              ),

              Divider(),
              SizedBox(height: Sizes.spaceBetweenItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Logout', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
