import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'détails.dart';


class liste_pharmacie extends StatefulWidget {
  const liste_pharmacie({super.key});

  @override
  liste_pharmacieState createState() => liste_pharmacieState();
}
class liste_pharmacieState extends State<liste_pharmacie> {
  @override
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
  void initState() {

    User? user = getCurrentUser();
    setState(() {
      userUID=user!.uid;

    });
    print(user!.uid);

    super.initState();
  }

    final CollectionReference UsersphRef = FirebaseFirestore.instance.collection('Usersph');
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Liste des pharmacies disponibles'),

        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: UsersphRef.snapshots(),
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
                String? nomph = data['nomph'] as String?;
                String? location = data['location'] as String?;
                return ListTile(
                  leading: ElevatedButton(
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => details(documentSnapshot: documentSnapshot)));                    },
                    child: Text('Détails '),
                  ),
                  title: Text(
                    'Nom du pharmacien : $nomph',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text(
                    'Localisation : $location',
                    style: TextStyle(fontSize: 15.0),
                  ),
                );
              },
            );
          },
        ),
      );
    }
}