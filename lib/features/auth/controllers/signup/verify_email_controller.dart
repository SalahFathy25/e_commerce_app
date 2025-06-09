import 'dart:async';

import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  late Timer _timer;

  // Send Email whenever Verify screen appears & set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  // send verification email link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your email for verification link.',
      );
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // timer to automatically redirect on email verification
  setTimerForAutoRedirect() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
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

  // manually check if email verification
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
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
