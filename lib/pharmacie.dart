import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'drawer.dart';

class pharmacie extends StatefulWidget {
  const pharmacie({super.key});

  @override
  pharmacieState createState() => pharmacieState();
}
class pharmacieState extends State<pharmacie> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

                  appBar: AppBar(
                    title: Text(
                      "Information",
                    ),
                  ),
                  body: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(


                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Date de la dose",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(


                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Nom de la dose",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),



                            GestureDetector(
                              onTap: () {


                              },
                              child: Container(
                                width: 180,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    "Ajouter",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {


                              },
                              child: Container(
                                width: 180,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    "Déconnecter ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),

            );

  }

}

