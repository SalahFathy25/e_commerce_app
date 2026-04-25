import 'package:e_commerce_app/features/auth/screens/login/login_screen.dart';
import 'package:e_commerce_app/features/auth/screens/onboarding/onboarding_screen.dart';
import 'package:e_commerce_app/features/auth/screens/signup/verify_email_screen.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../user/user_repository.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _supabase = Constants.supabase;

  /// Get Authentication User Data
  User? get authUser => _supabase.auth.currentUser;

  // called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show Relevant Screen
  screenRedirect() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      // In Supabase, we can check email_confirmed_at
      if (user.emailConfirmedAt != null) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  /* ------------------------------------ Email & Password sign-in ------------------------------------ */
  /// [EmailAuthentication] - LogIn
  Future<AuthResponse> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw 'Authentication Error: $e';
    }
  }

  /// [EmailAuthentication] - Register
  Future<AuthResponse> registerWithEmailAndPassword(
    String email,
    String password, {
    String? phone,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _supabase.auth.signUp(
        email: email,
        password: password,
        phone: phone,
        data: data,
      );
    } catch (e) {
      throw 'Registration Error: $e';
    }
  }

  /// [EmailVerification] - Email Verification
  Future<void> sendEmailVerification() async {
    try {
      // Supabase sends verification email automatically on signUp
      // But we can resend if needed
      await _supabase.auth.resend(type: OtpType.signup, email: authUser?.email);
    } catch (e) {
      throw 'Error sending verification: $e';
    }
  }

  /// [EmailAuthentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      throw 'Error sending password reset: $e';
    }
  }

  /// [Re-Authenticate] - Re-Authenticate User
  Future<AuthResponse> reAuthWithEmailAndPassword(String email, String password) async {
    try {
      return await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw 'Re-authentication Error: $e';
    }
  }

  /* ------------------------------------ Federated identity & social sign-in ------------------------------------ */
  /// [GoogleAuthentication] - SignIn with Google
  Future<AuthResponse?> googleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        throw 'No Google tokens found.';
      }

      return await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      throw 'Google Sign-In Error: $e';
    }
  }

  /* ------------------------------------ ./end Federated identity & social sign-in ------------------------------------ */
  /// [logout User] - Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _supabase.auth.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      throw 'Logout Error: $e';
    }
  }

  /// [Delete User] - Remove User auth and data
  Future<void> deleteAccount() async {
    try {
      final userId = authUser?.id;
      if (userId == null) throw 'No authenticated user found';

      // Supabase doesn't have a simple user.delete() on the client side for safety.
      // Usually, we delete the user record from our database table, 
      // and use a database trigger to delete the auth user, or use a service role.
      // For simplicity here, we delete from our public.users table.
      await UserRepository.instance.removeUserRecord(userId);
      
      // Note: Full auth deletion usually requires service_role key or Edge Function.
      await logout();
    } catch (e) {
      throw 'Delete Account Error: $e';
    }
  }
}
