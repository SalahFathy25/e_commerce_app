import 'package:e_commerce_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future<AuthResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Sign in failed: No user found')),
        );
      }
      return response;
    } catch (e) {
      ScaffoldMessenger.of(
        Get.context!,
      ).showSnackBar(SnackBar(content: Text('Sign in failed: $e')));
      rethrow;
    }
  }

  Future<AuthResponse> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/',
    );
    if (response.user == null && response.session == null) {
      throw Exception('Sign up failed');
    }
    return response;
  }

  Future<void> signOut() async {
    await Constants.supabase.auth.signOut();
  }

  User? getCurrentUser() {
    return Constants.supabase.auth.currentUser;
  }

  String? getCurrentUserEmail() {
    return Constants.supabase.auth.currentUser?.email;
  }

  Future<void> refreshSession() async {
    final session = Constants.supabase.auth.currentSession;
    if (session != null) {
      await Constants.supabase.auth.refreshSession();
    }
  }
}
