
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;


 /* void SignUp(String nom,String prenom,String email, String password, String cin, String trim) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      // Create a document in the "Users" collection with the same ID as the authenticated user
      FirebaseFirestore.instance.collection('Users').doc(userCredential.user?.uid).set({
        'nom': nameController.text.trim(),
        'prenom': prenomController.text.trim(),
        'cin': cinController.text.trim(),
        'email': emailController.text.trim(),
      });

      // Navigate to the home page
      Navigator.pushNamed(context as BuildContext, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
  print(e);
  }}*/

  Future<void> addUser(String nom,String prenom,String email,String cin ) async {
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

  Future ResetPassword(BuildContext context, String email) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar("Required", "Password Reset email sent !",
          icon: const Icon(
            Icons.warning_amber_rounded,
          ),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM);

      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Get.snackbar("Required", e.message.toString(),
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.deepPurple,
          ),
          colorText: Colors.deepPurple,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM);

      Navigator.of(context).pop();
    }
  }


}