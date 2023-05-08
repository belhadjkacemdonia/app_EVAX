import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import 'login.dart';
import 'login_pharmacie.dart';
import 'myliste.dart';

class rendez_vous extends StatefulWidget {
  const rendez_vous({super.key});

  @override
  rendez_vousState createState() => rendez_vousState();
}

class rendez_vousState extends State<rendez_vous> {
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
      userUID = user!.uid;
    });
    print(user!.uid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des rendez-vous'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == "myListe") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myliste()));
              } else if (value == "rendez-vous") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => rendez_vous()));
              } else if (value == "deconnecter") {
                AuthService().LogOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignIn()));
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
        stream: FirebaseFirestore.instance
            .collection('Usersph')
            .doc(userUID!)
            .collection("Reservation")
            .snapshots(),
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
              String? nomclient = data['nomclient'] as String?;
              String? mail = data['mail'] as String?;
              String? namevacin = data['namevacin'] as String?;
              String? date = data['date'] as String?;
              return ListTile(
                title: Text('nomclient : $nomclient',
                    style: TextStyle(fontSize: 25.0)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('mail : $mail', style: TextStyle(fontSize: 25.0)),
                    Text('namevacin : $namevacin',
                        style: TextStyle(fontSize: 25.0)),
                    Text('date : $date', style: TextStyle(fontSize: 25.0)),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
