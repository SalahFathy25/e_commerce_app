import 'package:e_commerce_app/data/services/auth_service.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email_screen.dart';
import 'terms_and_condition_checkbox.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final firstController = TextEditingController();
  final lastController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final authServices = AuthService();

  bool isLoading = false;
  bool _obscurePassword = true;

  Future<void> signUpNewUser() async {
    emailController.text = emailController.text.trim();
    passwordController.text = passwordController.text.trim();
    if (!formKey.currentState!.validate()) return;
    setState(() {
      isLoading = true;
    });
    try {
      authServices.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      Get.to(
        () => VerifyEmailScreen(
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      // if (authServices.getCurrentUserEmail() != null) {
      //   Get.to(() => VerifyEmailScreen(email: emailController.text));
      // }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$error')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstController,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TextStrings.firstName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: Sizes.spaceBetweenInputFields),
              Expanded(
                child: TextFormField(
                  controller: lastController,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TextStrings.lastName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
              ),
            ],
          ),

          const SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            controller: usernameController,
            expands: false,
            decoration: InputDecoration(
              labelText: TextStrings.username,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
            validator: (value) => value!.isEmpty ? 'Required' : null,
          ),

          const SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: TextStrings.email,
              prefixIcon: const Icon(Iconsax.direct),
            ),
            validator: Validator.validateEmail,
          ),

          const SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: TextStrings.phoneNo,
              prefixIcon: const Icon(Iconsax.call),
            ),
            validator: (value) => value!.isEmpty ? 'Required' : null,
          ),

          const SizedBox(height: Sizes.spaceBetweenInputFields),
          TextFormField(
            controller: passwordController,
            validator: Validator.validatePassword,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: TextStrings.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon:
                    _obscurePassword
                        ? const Icon(Iconsax.eye_slash)
                        : const Icon(Iconsax.eye),
              ),
            ),
          ),
          const SizedBox(height: Sizes.spaceBetweenSections),

          const TermsAndConditionCheckBox(),
          const SizedBox(height: Sizes.spaceBetweenSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : signUpNewUser,
              child:
                  isLoading
                      ? const CircularProgressIndicator()
                      : Text(TextStrings.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
