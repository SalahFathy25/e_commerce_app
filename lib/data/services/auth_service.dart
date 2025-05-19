import 'package:e_commerce_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future<AuthResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) {
      ScaffoldMessenger.of(
        Get.context!,
      ).showSnackBar(const SnackBar(content: Text('Sign in failed')));
    }
    return response;
  }

  Future<AuthResponse> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );
    if (response.user == null) {
      throw Exception('Sign up failed');
    }
    return response;
  }

  Future<void> signOut() async {
    await Constants.supabase.auth.signOut();
  }

  String? getCurrentUserEmail() {
    final session = Constants.supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
