// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evax_app/cinWidget.dart';
import 'package:evax_app/minorWidget.dart';
import 'package:evax_app/pasportWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'login.dart';
import 'drawer.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _selectedOption = "Connecter avec CIN";

  List<String> _options = [
    "Connecter avec CIN",
    "Connecter en tanque mineur",
    "Connecter avec Numero Pasport",
  ];

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController namemereController = TextEditingController();
  final TextEditingController namepereController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _selectedOption = "Connecter avec CIN";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Mydrawer(),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red.shade900,
              Colors.red.shade300,
              Colors.blue.shade600,
            ],
          )),
          child: Center(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 100),
                                  child: const Text(
                                    'EVAX\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.8,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Center(
                                child: DropdownButton<String>(
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedOption = value!;
                                    });
                                  },
                                  value: _selectedOption,
                                  items: _options.map((String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                ),
                              ),
                              _selectedOption == "Connecter avec CIN"
                                  ? CinSignUp(
                                      nameController: nameController,
                                      prenomController: prenomController,
                                      cinController: cinController,
                                      emailController: emailController,
                                      passwordController: passwordController)
                                  : _selectedOption ==
                                          "Connecter en tanque mineur"
                                      ? MinorSignUp(
                                          nameController: nameController,
                                          prenomController: prenomController,
                                          emailController: emailController,
                                          namemereController:
                                              namemereController,
                                          namepereController:
                                              namepereController,
                                          passwordController:
                                              passwordController)
                                      : PassportSignUp(
                                          nameController: nameController,
                                          prenomController: prenomController,
                                          passpotController: passportController,
                                          emailController: emailController,
                                          passwordController:
                                              passwordController),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 80.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Color(000000),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          // foreground
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            signup();
                                          }
                                        },
                                        child: const Text(
                                          'sign up',
                                          style: TextStyle(
                                            fontSize: 20,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: Colors.black38,
                                                offset: Offset(-5.0, 5.0),
                                              ),
                                            ],
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.to(SignIn());
                                    },
                                    child: Text(
                                      'Already have an account ?',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void signup() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      // Create a document in the "Users" collection with the same ID as the authenticated user
      FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user?.uid)
          .set({
        'nom': nameController.text.trim(),
        'prenom': prenomController.text.trim(),
        'cin': cinController.text.trim(),
        'pere': namepereController.text.trim(),
        'mere': namemereController.text.trim(),
        'email': emailController.text.trim(),
        'type': _selectedOption == "Connecter avec CIN"
            ? "cin"
            : _selectedOption == "Connecter en tanque mineur"
                ? "mineur"
                : "passport",
      });
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
}
