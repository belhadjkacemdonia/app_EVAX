import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'drawer.dart';
import 'login_pharmacie.dart';
import 'main.dart';


class SignUp_Pharmacie extends StatefulWidget{
  const SignUp_Pharmacie({super.key});
  @override
  State<SignUp_Pharmacie> createState() => _SignUp_PharmacieState();
}

class _SignUp_PharmacieState extends State<SignUp_Pharmacie> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailphController = TextEditingController();
  final TextEditingController namephController = TextEditingController();
  final TextEditingController localController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordphController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(

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
                                    'Inscription\n',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.8,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [

                        TextFormField(

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ du nom de la pharmacie ne doit pas être vide';
                            }
                            return null;
                          },
                          style: TextStyle(),
                          controller: namephController,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Nom de la pharmacie",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ Téléphone ne doit pas être vide';
                            } else if (value.trim().length != 8 ) {
                              return 'Le numéro de téléphone doit comporter au moins 3 caractères';
                            }
                            return null;
                          },
                          style: TextStyle(),
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Téléphone",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: localController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ de localisation ne doit pas être vide';
                            }
                            return null;
                          },
                          style: TextStyle(),
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Localisation",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailphController,
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ Email ne doit pas être vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passwordphController,
                          style: TextStyle(),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Le champ du mot de passe ne doit pas être vide';
                            } else if (value.length < 6) {
                              return 'Le mot de passe doit contenir au moins 6 caractères';
                            } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(value)) {
                              return 'Le mot de passe doit contenir au moins une lettre majuscule, une lettre minuscule et un chiffre';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintText: 'Mot de passe',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),



                      ],
                    ),
                  ),
                              SizedBox(
                                height: 20,
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
                                            signuph();

                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => SignInPharmacie()));
                                          }},
                                        child: const Text(
                                          "S'inscrire",
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
                                      Get.to(SignInPharmacie());
                                    },
                                    child: Text(
                                      'Vous avez déjà un compte ?',
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
  void signuph() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailphController.text.trim(),
          password: passwordphController.text.trim());

      // Create a document in the "Users" collection with the same ID as the authenticated user
      FirebaseFirestore.instance
          .collection('Usersph')
          .doc(userCredential.user?.uid)
          .set({
        'nomph': namephController.text.trim(),
        'Phone': phoneController.text.trim(),
        'location': localController.text.trim(),
        'email': emailphController.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Required", e.message.toString(),
          icon: const Icon(
            Icons.warning_amber_rounded,
          ),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}