import 'dart:async';

import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/services/auth_service.dart';
import '../login/login_screen.dart';
import 'signup_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final bool _isLoading = false;
  final authServices = AuthService();
  Timer? emailCheckTimer;

  @override
  void initState() {
    super.initState();
    startEmailVerificationCheck();
  }

  @override
  void dispose() {
    emailCheckTimer?.cancel();
    super.dispose();
  }

  void startEmailVerificationCheck() {
    emailCheckTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      final user = authServices.getCurrentUser();

      await authServices.refreshSession();

      if (user != null && user.emailConfirmedAt != null) {
        emailCheckTimer?.cancel();

        if (mounted) {
          Get.offAll(
            () => SuccessScreen(
              image: ImagesStrings.staticSuccessIllustration,
              title: TextStrings.yourAccountCreatedTitle,
              subTitle: TextStrings.yourAccountCreatedSubTitle,
              onPressed: () => Get.to(() => const LoginScreen()),
            ),
          );
        }
      }
    });
  }

  Future<void> resendVerificationEmail() async {
    try {
      authServices.signUpWithEmailAndPassword(widget.email, widget.password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('the email has been resent')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to resend email: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const SignupScreen()),
            icon: const Icon(CupertinoIcons.clear_circled),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(
                  ImagesStrings.deliveredEmailIllustration,
                ),
                width: HelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),
              Text(
                TextStrings.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),
              Text(
                widget.email,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBetweenItems),
              Text(
                TextStrings.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.spaceBetweenSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : resendVerificationEmail,
                  icon:
                      _isLoading
                          ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                          : const Icon(Icons.email_outlined, size: 21),
                  label: Text(TextStrings.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
