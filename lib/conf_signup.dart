import 'package:flutter/material.dart';
import 'citoyen_cin.dart';
import 'drawer.dart';

class Conf_signUp extends StatefulWidget {
  const Conf_signUp({super.key});

  @override
  _Conf_signUpState createState() => _Conf_signUpState();
}

class _Conf_signUpState extends State<Conf_signUp> {
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
                                TextFormField(
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
                                TextFormField(
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
                                TextFormField(
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignIn()));
                                          },
                                          child: const Text(
                                            'SignUp',
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
}
