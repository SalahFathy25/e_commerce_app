import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/auth/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _supabase = Constants.supabase;

  // Function to save user data in Supabase Database
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _supabase.from('users').upsert(user.toJson());
    } catch (e) {
      throw 'Error saving user record: $e';
    }
  }

  // Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.id;
      if (userId == null) return UserModel.empty();

      final data = await _supabase.from('users').select().eq('id', userId).single();
      return UserModel.fromJson(data);
    } catch (e) {
      return UserModel.empty();
    }
  }

  // Function to update user data in Supabase
  Future<void> updateUserRecord(UserModel updatedUser) async {
    try {
      await _supabase.from('users').update(updatedUser.toJson()).eq('id', updatedUser.id);
    } catch (e) {
      throw 'Error updating user record: $e';
    }
  }

  // Function to Update any field in specific Users Table
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.id;
      if (userId == null) throw 'User is not logged in';

      await _supabase.from('users').update(json).eq('id', userId);
    } catch (e) {
      throw 'Error updating field: $e';
    }
  }

  // Function to remove user data from Supabase
  Future<void> removeUserRecord(String userId) async {
    try {
      await _supabase.from('users').delete().eq('id', userId);
    } catch (e) {
      throw 'Error removing user record: $e';
    }
  }

  // Upload any Image for Supabase Storage
  Future<String> uploadImage(XFile image) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.id;
      if (userId == null) throw 'User not found';

      final bytes = await image.readAsBytes();
      final fileExt = image.path.split('.').last;
      final fileName = '$userId/${DateTime.now().millisecondsSinceEpoch}.$fileExt';

      await _supabase.storage.from('profiles').uploadBinary(
            fileName,
            bytes,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
          );

      final String publicUrl = _supabase.storage.from('profiles').getPublicUrl(fileName);
      return publicUrl;
    } catch (e) {
      throw 'Something went wrong while uploading image: $e';
    }
  }
}
