import 'dart:async';

import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../data/services/auth_service.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password_screen.dart';
import '../../signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  final authServices = AuthService();

  bool isLoading = false;
  bool redirecting = false;
  bool rememberMe = true;
  bool obscurePassword = true;

  Future<AuthResponse> signIn() async {
    emailController.text = emailController.text.trim();
    passwordController.text = passwordController.text.trim();
    if (!formKey.currentState!.validate()) return AuthResponse();
    setState(() {
      isLoading = true;
    });
    try {
      final response = await authServices.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      if (mounted && response.user == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Sign in failed')));
      }

      return response;
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$error')));
      }
      return AuthResponse();
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // @override
  // void initState() {
  //   _authStateSubscription = Constants.supabase.auth.onAuthStateChange.listen(
  //     (data) {
  //       if (_redirecting) return;
  //       final session = data.session;
  //       if (session != null) {
  //         _redirecting = true;
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => const NavigationMenu()),
  //         );
  //       }
  //     },
  //     onError: (error) {
  //       if (error is AuthException) {
  //         ScaffoldMessenger.of(
  //           context,
  //         ).showSnackBar(SnackBar(content: Text(error.message)));
  //       } else {
  //         ScaffoldMessenger.of(
  //           context,
  //         ).showSnackBar(const SnackBar(content: Text('Failed to sign in')));
  //       }
  //     },
  //   );
  //   super.initState();
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: Validator.validateEmail,
              decoration: InputDecoration(
                labelText: TextStrings.email,
                prefixIcon: const Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields),
            TextFormField(
              controller: passwordController,
              validator: Validator.validatePassword,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: TextStrings.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  icon:
                      obscurePassword
                          ? const Icon(Iconsax.eye_slash)
                          : const Icon(Iconsax.eye),
                ),
              ),
            ),
            const SizedBox(height: Sizes.spaceBetweenInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
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
                // onPressed:
                // () => Get.to(
                //   () => const NavigationMenu(),
                //   transition: Transition.size,
                // ),
                onPressed: isLoading ? null : signIn,
                child:
                    isLoading
                        ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 6,
                        )
                        : Text(TextStrings.signIn),
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
