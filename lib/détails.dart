
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class details extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const details({super.key, required this.documentSnapshot});
  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {

  String? nameclient;
  String? mail;
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

    getUserPostData(userUID!);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(height: 600,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Usersph').doc(widget.documentSnapshot.id).collection("Disponibiliter").snapshots(),
          builder: (context, snapshot) {

            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text('Something went wrong');
            }
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,

              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                snapshot.data!.docs[index];
                return ListTile(
                  trailing: IconButton(onPressed: (){

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('confiremer reservation '),
                        content: Text(documentSnapshot['date']+ " "+documentSnapshot['nomVacin']),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('annuler'),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseFirestore.instance.collection('Usersph').doc(widget.documentSnapshot.id).collection('Reservation').add({
                                'nomclient': nameclient,
                                'mail': mail,
                                'uid': userUID,
                                'date': documentSnapshot['date'],
                                'namevacin': documentSnapshot['nomVacin'],

                              });
                              Navigator.pop(context);


                            },
                            child: Text('oui'),
                          ),
                        ],
                      ),
                    );







                    }, icon: Icon(Icons.add)),
                  title: Text(documentSnapshot["nomVacin"]),
                  subtitle: Text(documentSnapshot['date']),
                );
              },
            );

          },
        ),
      ),
    );
  }


  getUserPostData(String userID) async {
    final postRef =
    FirebaseFirestore.instance.collection('Users').doc(userID);
    final postDoc = await postRef.get();

    if (postDoc.exists) {
      final data = postDoc.data();
      setState(() {
        nameclient = data!['nom'];
        mail = data['email'];


      });
    } else {
      throw Exception('Post with ID $userID does not exist.');
    }
  }
}
