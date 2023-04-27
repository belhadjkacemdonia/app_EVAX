import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';
import 'gallery.dart';
import 'login_pharmacie.dart';
class myliste extends StatefulWidget {
  const myliste({super.key});

  @override
  mylisteState createState() => mylisteState();
}
class mylisteState extends State<myliste> {
  final CollectionReference disponibiliterRef = FirebaseFirestore.instance.collection('Disponibiliter');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma Liste'),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: disponibiliterRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return Text('Chargement en cours...');
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
              Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;
              String? nom = data['nom'] as String?;
              String? date = data['date'] as String?;
              return ListTile(
                title: Text('nom : $nom',style: TextStyle(
                  fontSize: 25.0)),
                subtitle: Text('date : $date',style: TextStyle(
                    fontSize: 25.0)),
              );
            },
          );
        },
      ),
    );
  }
}