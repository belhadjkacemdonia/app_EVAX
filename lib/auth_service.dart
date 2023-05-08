import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;



  Future<void> addUser(
      String nom, String prenom, String email, String cin) async {
    // Generate a new document ID
    final newDocRef = FirebaseFirestore.instance.collection('Users').doc();
    //final newDocId = newDocRef.id;

    // Create the new document with the ID
    await newDocRef.set({
      'nom': nom,
      'prenom': prenom,
      'cin': cin,
      'email': email,
    });
  }

  Future SignIn(BuildContext context, String email, String password) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Required", e.message.toString(),
          icon: const Icon(
            Icons.warning_amber_rounded,
          ),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }

  Future<void> LogOut() async {
    await FirebaseAuth.instance.signOut();

  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } on Exception {
      Get.snackbar("Required", "Verification email sent!",
          icon: const Icon(
            Icons.warning_amber_rounded,
          ),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }


}
