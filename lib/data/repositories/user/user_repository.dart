import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase/supabase.dart';

import '../../../features/auth/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data in Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
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

  // Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot =
          await _db
              .collection('users')
              .doc(AuthenticationRepository.instance.authUser!.uid)
              .get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  // Function to update user data in Firestore
  Future<void> updateUserRecord(UserModel updatedUser) async {
    try {
      await _db
          .collection('users')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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

  // Function to Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('users')
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .update(json);
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

  // Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
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

  // Upload any Image for Supabase Storage
  Future<String> uploadImage(String path, XFile image) async {
    final storage = Constants.supabase.storage;
    try {
      final Uint8List data = await image.readAsBytes();

      // Get Firebase Auth user ID
      final firebaseUser = FirebaseAuth.instance.currentUser;

      final fileName = '${firebaseUser?.uid}.jpg';
      final path = 'profiles/$fileName'; // Optional folder in bucket

      final result = await storage.from('profiles').uploadBinary(path, data);

      final publicUrl = storage.from('profiles').getPublicUrl(path);
      return publicUrl;
    } on StorageException catch (e) {
      throw Exception('Storage error: ${e.message}');
    } on PlatformException catch (e) {
      throw Exception('Platform error: ${e.message}');
    } on FormatException {
      throw const FormatException('Invalid image format');
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
