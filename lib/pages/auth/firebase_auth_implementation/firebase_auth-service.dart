// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'dart:convert';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      // Create user in Firebase Authentication
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Hash the password
      String hashedPassword = _hashPassword(password);

      // Store user data in Firestore
      await FirebaseFirestore.instance
          .collection('end-users')
          .doc(credential.user!.uid)
          .set({
        'email': email,
        'password': hashedPassword,
        // You can add more user data here if needed
      });

      return credential.user;
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  String _hashPassword(String password) {
    // Use a secure hash algorithm like SHA-256
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Failed to pick image');
    }
    return null;
  }
}
