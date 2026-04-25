import 'dart:async';

import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please Check your inbox and verify your email.',
      );
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Timer to check if Email is verified
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      final supabase = Supabase.instance.client;
      // In Supabase, we can refresh the session to get updated user data
      await supabase.auth.refreshSession();
      final user = supabase.auth.currentUser;

      if (user != null && user.emailConfirmedAt != null) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: ImagesStrings.successfullyRegisterAnimation,
            title: TextStrings.yourAccountCreatedTitle,
            subTitle: TextStrings.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  // Manually Check if Email is verified
  checkEmailVerificationStatus() async {
    final supabase = Supabase.instance.client;
    await supabase.auth.refreshSession();
    final user = supabase.auth.currentUser;

    if (user != null && user.emailConfirmedAt != null) {
      Get.off(
        () => SuccessScreen(
          image: ImagesStrings.successfullyRegisterAnimation,
          title: TextStrings.yourAccountCreatedTitle,
          subTitle: TextStrings.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
