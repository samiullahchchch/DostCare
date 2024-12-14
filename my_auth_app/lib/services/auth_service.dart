import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Adds user data to Firestore
  Future<void> addUserData(String uid, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(uid).set(data);
      log("User data saved successfully for UID: $uid");
    } catch (e) {
      log("Error saving user data: $e");
      throw Exception("Error saving user data: $e");
    }
  }

  /// Handles signup with email, password, and username
  Future<String?> signupWithEmail(
      String email, String password, String username) async {
    try {
      // Create user with Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Creating user with UID: ${userCredential.user!.uid}");

      // Add user details to Firestore
      await addUserData(userCredential.user!.uid, {
        'username': username,
        'email': email,
        'created_at':
            DateTime.now().toString(), // Store the current date as string
      });

      return "Signup Successful";
    } catch (e) {
      return e.toString();
    }
  }

  /// Fetches user information from Firestore
  Future<Map<String, String>> getUserInfo() async {
    final user = _auth.currentUser;

    if (user != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(user.uid).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return {
          'username': data['username'] ?? '',
          'email': data['email'] ?? '',
          'created_at': data['created_at']?.toString() ??
              '' // Include the date in the response
        };
      }
    }
    return {'username': '', 'email': '', 'created_at': ''};
  }
}
