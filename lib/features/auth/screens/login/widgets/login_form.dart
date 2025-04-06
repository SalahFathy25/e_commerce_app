import 'package:e_commerce_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password_screen.dart';
import '../../signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: TextStrings.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            SizedBox(height: Sizes.spaceBetweenInputFields),
            TextFormField(
              decoration: InputDecoration(
                labelText: TextStrings.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            SizedBox(height: Sizes.spaceBetweenInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(TextStrings.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed:
                      () => Get.to(
                        () => const ForgetPasswordScreen(),
                        transition: Transition.rightToLeft,
                      ),
                  child: Text(
                    TextStrings.forgetPassword,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.spaceBetweenSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    () => Get.to(
                      () => const NavigationMenu(),
                      transition: Transition.size,
                    ),
                child: Text(TextStrings.signIn),
              ),
            ),
            SizedBox(height: Sizes.spaceBetweenItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed:
                    () => Get.to(
                      () => const SignupScreen(),
                      transition: Transition.size,
                    ),
                child: Text(TextStrings.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
