import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/network/network_manager.dart';
import '../../models/user_model.dart';
import '../../screens/signup/verify_email_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  //-- signup
  void signup() async {
    try {
      //Start Loading
      FullScreenLoader.openLoadingDialog(
        'We Are Processing Your information...',
        // ImagesStrings.docerAnimation,
        ImagesStrings.animalIcon,
      );

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (signUpFormKey.currentState == null || !signUpFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoading();
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the privacy policy & terms of use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            emailController.text.trim(),
            passwordController.text.trim(),
          );

      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        throw Exception('User registration failed. Please try again.');
      }

      // Save authentication user data in Firestore
      final newUser = UserModel(
        id: firebaseUser.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Stop Loading
      FullScreenLoader.stopLoading();

      // Show success message
      Loaders.successSnackBar(
        title: 'Congratulations',
        message:
            'Your account has been created successfully! Verify your email to continue.',
      );

      // Move to the verify email screen
      Get.to(() => VerifyEmailScreen(email: emailController.text.trim()));
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      Loaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
