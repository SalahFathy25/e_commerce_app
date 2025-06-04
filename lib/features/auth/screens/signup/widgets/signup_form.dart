import 'package:e_commerce_app/features/auth/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'terms_and_condition_checkbox.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstNameController,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TextStrings.firstName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                  validator:
                      (value) =>
                          Validator.validateEmptyText('First name', value),
                ),
              ),
              const SizedBox(width: Sizes.spaceBetweenInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastNameController,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TextStrings.lastName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                  validator:
                      (value) =>
                          Validator.validateEmptyText('Last name', value),
                ),
              ),
            ],
          ),

          const SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            controller: controller.usernameController,
            expands: false,
            decoration: InputDecoration(
              labelText: TextStrings.username,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
            validator:
                (value) => Validator.validateEmptyText('Username', value),
          ),

          const SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
              labelText: TextStrings.email,
              prefixIcon: const Icon(Iconsax.direct),
            ),
            validator: (value) => Validator.validateEmail(value),
          ),

          const SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            controller: controller.phoneController,
            decoration: InputDecoration(
              labelText: TextStrings.phoneNo,
              prefixIcon: const Icon(Iconsax.call),
            ),
            validator: (value) => value!.isEmpty ? 'Required' : null,
          ),

          const SizedBox(height: Sizes.spaceBetweenInputFields),
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              validator: (value) => Validator.validatePassword(value),
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
          const SizedBox(height: Sizes.spaceBetweenSections),

          const TermsAndConditionCheckBox(),
          const SizedBox(height: Sizes.spaceBetweenSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Text(TextStrings.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
