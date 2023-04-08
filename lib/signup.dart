
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'citoyen_cin.dart';

import 'drawer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign UP"),
          backgroundColor: Colors.red,
        ),
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
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 35, right: 35),
                            child: Column(
                              children: [

                                TextFormField(controller: prenomController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: "Prénom",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(controller: nameController,
                                  style: TextStyle(),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: "Nom",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(controller: cinController,
                                  style: TextStyle(),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: "Cin",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(controller: emailController,

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

                                TextFormField(controller: passwordController,

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

                                            signup();},
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignIn()));
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
                          )
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
      FirebaseFirestore.instance.collection('Users').doc(userCredential.user?.uid).set({
        'nom': nameController.text.trim(),
        'prenom': prenomController.text.trim(),
        'cin': cinController.text.trim(),
        'email': emailController.text.trim(),
      });

      // Navigate to the home page
      //Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
  print(e);
  }}

}

