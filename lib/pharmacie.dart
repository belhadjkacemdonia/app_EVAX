import 'package:evax_app/main.dart';
import 'package:evax_app/rendez-vous.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import 'drawer.dart';
import 'gallery.dart';
import 'login.dart';
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



  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userUID;


  User? getCurrentUser() {
    final User? user = _auth.currentUser;
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    nameController.dispose();
    super.dispose();
  }
@override
  void initState() {

    User? user = getCurrentUser();
    setState(() {
      userUID=user!.uid;

    });
    print(user!.uid);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
        automaticallyImplyLeading: false, //supprimer la flèche de retour sur la barre d'applications
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == "myListe") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => myliste()));

              }else if (value == "rendez-vous") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => gallery()));
              } else if (value == "deconnecter") {
                AuthService().LogOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
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
                  FirebaseFirestore.instance.collection('Usersph').doc(userUID).collection('Disponibiliter').add({
                    'nomVacin': nameController.text.trim(),
                    'date': dateController.text.trim(),
                  }).then((value) {nameController.clear();
                  dateController.clear();});
                  /*addUser(getCurrentUser()!.uid,
                    nameController.text.trim(),
                    dateController.text.trim(),
                  ).then((value){ print("ffff");nameController.clear();
                  dateController.clear();} )*/;
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

  Future<void> addUser(String nom, String date,String phId) async {


    // Generate a new document ID
    final   collectionReference = FirebaseFirestore.instance.collection('Usersph').doc(phId).collection('Disponibiliter');
    //final newDocId = newDocRef.id;

    // Create the new document with the ID
    await collectionReference.add({
      'nomVacin': nom,
      'date': date,
    });
  }

}


