import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'reset_password_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextStrings.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),
            Text(
              TextStrings.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: Sizes.spaceBetweenSections * 2),

            TextFormField(
              decoration: InputDecoration(
                labelText: TextStrings.email,
                prefixIcon: const Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  Get.off(
                    () => const ResetPasswordScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: Text(TextStrings.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
