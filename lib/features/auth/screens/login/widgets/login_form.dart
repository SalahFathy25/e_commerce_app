import 'package:e_commerce_app/features/auth/screens/signup/signup_screen.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_configuration/forget_password_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: InputDecoration(
                labelText: TextStrings.email,
                prefixIcon: const Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator:
                    (value) => Validator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TextStrings.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed:
                        () =>
                            controller.hidePassword.value =
                                !controller.hidePassword.value,
                    icon:
                        controller.hidePassword.value
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged:
                            (value) =>
                                controller.rememberMe.value =
                                    !controller.rememberMe.value,
                      ),
                    ),
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
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Sizes.spaceBetweenSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(TextStrings.signIn),
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenItems),
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
