import 'package:evax_app/main.dart';
import 'package:evax_app/rendez-vous.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import 'drawer.dart';
import 'gallery.dart';
import 'login_pharmacie.dart';
import 'main.dart';
import 'myliste.dart';

class pharmacie extends StatefulWidget {
  const pharmacie({super.key});

  @override
  pharmacieState createState() => pharmacieState();
}
class pharmacieState extends State<pharmacie> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == "myListe") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => myliste()));

              }else if (value == "rendez-vous") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => gallery()));
              } else if (value == "deconnecter") {
                AuthService().LogOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPharmacie()));
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "myListe",
                  child: Text("MyListe"),
                ),
                PopupMenuItem(
                  value: "rendez-vous",
                  child: Text("rendez-vous"),
                ),
                PopupMenuItem(
                  value: "deconnecter",
                  child: Text("Déconnecter"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: dateController,
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
                controller: nameController,
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
                  addUser(
                    nameController.text.trim(),
                    dateController.text.trim(),
                  );
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
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUser(String nom, String date) async {
    // Generate a new document ID
    final newDocRef = FirebaseFirestore.instance.collection('Disponibiliter').doc();
    //final newDocId = newDocRef.id;

    // Create the new document with the ID
    await newDocRef.set({
      'nom': nom,
      'date': date,
    });
  }
}


