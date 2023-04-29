import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import 'login_pharmacie.dart';
import 'myliste.dart';

class reservation extends StatefulWidget {
  const reservation({super.key});

  @override
  reservationState createState() => reservationState();
}

class reservationState extends State<reservation> {
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
        title: Text('Reservation'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
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
              String? nomph = data['nomph'] as String?;
              String? location = data['location'] as String?;
              String? namevacin = data['namevacin'] as String?;
              String? date = data['date'] as String?;
              String? Phone = data['Phone'] as String?;
              return ListTile(
                title: Text('nomph : $nomph', style: TextStyle(fontSize: 25.0)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('location : $location',
                        style: TextStyle(fontSize: 25.0)),
                    Text('Phone : $Phone', style: TextStyle(fontSize: 25.0)),
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
