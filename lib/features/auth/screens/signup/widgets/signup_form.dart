import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email_screen.dart';
import 'terms_and_condition_checkbox.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TextStrings.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: Sizes.spaceBetweenInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TextStrings.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TextStrings.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            decoration: InputDecoration(
              labelText: TextStrings.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            decoration: InputDecoration(
              labelText: TextStrings.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: TextStrings.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          SizedBox(height: Sizes.spaceBetweenSections),

          TermsAndConditionCheckBox(),
          SizedBox(height: Sizes.spaceBetweenSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  () => Get.to(
                    () => const VerifyEmailScreen(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 500),
                  ),
              child: Text(TextStrings.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
