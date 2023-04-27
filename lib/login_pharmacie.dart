import 'package:evax_app/auth_service.dart';
import 'package:evax_app/pharmacie.dart';
import 'package:evax_app/signup_pharmacie.dart';
import 'package:evax_app/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class SignInPharmacie extends StatefulWidget {
  const SignInPharmacie({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api

  _SignInPharmacieState createState() => _SignInPharmacieState();
}

class _SignInPharmacieState extends State<SignInPharmacie> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailphController = TextEditingController();
  final TextEditingController passwordphController = TextEditingController();

  @override
  void dispose() {
    emailphController.dispose();
    passwordphController.dispose();
    super.dispose();
  }

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
                    // padding:
                    //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.44),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(top: 130),
                                child: Text(
                                  'CONNEXION PHARMACIE\n',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.8,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailphController,
                                style: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'email field must not be empty';
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
                                  if (value!.isEmpty) {
                                    return 'password field must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
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
                                            SignInph(
                                                context,
                                                emailphController.text.trim(),
                                                passwordphController.text.trim());

                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                          builder: (context) => pharmacie()));

                                          } },
                                        child: const Text(
                                          'sign In',
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
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUp_Pharmacie()));
                                      },
                                      child: Text(
                                        'Dont have an account ?',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      )),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password ?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 230,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future SignInph(BuildContext context, String email, String password) async {
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
  }
}
