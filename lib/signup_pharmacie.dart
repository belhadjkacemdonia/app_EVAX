import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'drawer.dart';
import 'login_pharmacie.dart';


class SignUp_Pharmacie extends StatefulWidget{
  const SignUp_Pharmacie({super.key});
  @override
  State<SignUp_Pharmacie> createState() => _SignUp_PharmacieState();
}

class _SignUp_PharmacieState extends State<SignUp_Pharmacie> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Mydrawer(),
        appBar: AppBar(
          title: Text("Sign IN"),
          backgroundColor: Colors.red,
        ),
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
                                    'Inscription \n',
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
                              return 'Nom field must not be empty';
                            }
                            return null;
                          },
                          style: TextStyle(),
                          obscureText: true,
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

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone field must not be empty';
                            }
                            return null;
                          },
                          style: TextStyle(),
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Phone",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Location field must not be empty';
                            }
                            return null;
                          },
                          style: TextStyle(),
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Location",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(

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
                                      Get.to(SignInPharmacie());
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

}