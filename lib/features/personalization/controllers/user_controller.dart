import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/auth/models/user_model.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/network/network_manager.dart';
import '../../auth/screens/login/login_screen.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await UserRepository.instance.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any Auth provider
  Future<void> saveUserRecord(AuthResponse? response) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (response?.user != null) {
          final supabaseUser = response!.user!;
          final nameParts = UserModel.nameParts(supabaseUser.userMetadata?['full_name'] ?? '');
          final username = UserModel.generateUsername(supabaseUser.userMetadata?['full_name'] ?? '');

          final user = UserModel(
            id: supabaseUser.id,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: supabaseUser.email ?? '',
            phoneNumber: supabaseUser.phone ?? '',
            profilePicture: supabaseUser.userMetadata?['avatar_url'] ?? '',
          );

          await UserRepository.instance.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information.',
      );
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(Sizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async {
          deleteUserAccount();
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.lg),

          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text('Cancel'),
      ),
    );
  }

  // Delete User Account
  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog(
        'Processing...',
        ImagesStrings.loading,
      );

      // First reauthenticate the user (Simplified for Supabase here)
      final auth = AuthenticationRepository.instance;
      final user = auth.authUser;

      if (user == null) {
        FullScreenLoader.stopLoading();
        Loaders.errorSnackBar(title: 'Error', message: 'User not logged in.');
        return;
      }

      // In Supabase, we can check identities
      final identities = user.identities ?? [];
      if (identities.isNotEmpty) {
        final isGoogle = identities.any((element) => element.provider == 'google');

        if (isGoogle) {
          await auth.googleSignIn();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else {
          // Default to ReAuth form for Email/Password
          FullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthUserLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      await FullScreenLoader.stopLoading();
    }
  }

  // Reauthenticate before deleting
  Future<void> reAuthEmailAndPassword() async {
    try {
      FullScreenLoader.openLoadingDialog(
        'Processing...',
        ImagesStrings.loading,
      );

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();

      // Show Error Message
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        imageUploading.value = true;

        // Upload Image
        final imageUrl = await userRepository.uploadImage(image);

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your profile Image has been updated successfully.',
        );
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
