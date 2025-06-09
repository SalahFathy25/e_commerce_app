import 'package:e_commerce_app/features/auth/screens/login/login_screen.dart';
import 'package:e_commerce_app/features/auth/screens/onboarding/onboarding_screen.dart';
import 'package:e_commerce_app/features/auth/screens/signup/verify_email_screen.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      // localStorage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  /* ------------------------------------ Email & Password sign-in ------------------------------------ */
  /// [EmailAuthentication] - LogIn
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth');
    } on FormatException catch (_) {
      throw FormatException;
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth');
    } on FormatException catch (_) {
      throw FormatException;
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Re-Authenticate] - Re-Authenticate User

  /// [EmailVerification] - Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth');
    } on FormatException catch (_) {
      throw FormatException;
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - Forget Password

  /* ------------------------------------ Federated identity & social sign-in ------------------------------------ */
  /// [GoogleAuthentication] - SignIn with Google
  Future<UserCredential?> googleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth');
    } on FormatException catch (_) {
      throw FormatException;
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      if (kDebugMode) print('Google SignIn Error: $e');
    }
    return null;
  }

  /// [FacebookAuthentication] - SignIn with Facebook

  /* ------------------------------------ ./end Federated identity & social sign-in ------------------------------------ */
  /// [logout User] - Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: 'firebase_auth');
    } on FormatException catch (_) {
      throw FormatException;
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Delete User] - Remove User auth and firestore account
}
