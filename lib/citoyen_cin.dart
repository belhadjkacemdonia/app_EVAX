import 'package:evax_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'signin.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign IN"),
        backgroundColor: Colors.red,),
      drawer: Mydrawer(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient( begin: Alignment.topCenter,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 80.0),
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
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> citoyen_cin()
                                          ));
                                        },
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {

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
                                onPressed: () {

                                },
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
}

