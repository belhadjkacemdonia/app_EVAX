import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evax_app/auth_service.dart';
import 'package:evax_app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'CustomListTile.dart';
import 'gallery.dart';
import 'acceuil.dart';
import 'contact.dart';
import 'espace_citoyen.dart';
import 'modifier_profile.dart';
import 'signup_pharmacie.dart';
import 'login.dart';
import 'login_pharmacie.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  State<Mydrawer> createState() => _MydrawerState();
}



class _MydrawerState extends State<Mydrawer> {
  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {

    return Drawer(
      //menu
      child: ListView(
        children: <Widget>[
          FutureBuilder<DocumentSnapshot>(
              future: users.doc(user!.uid).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return DrawerHeader(
                    //partie photo
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Colors.red,
                      Colors.red,
                    ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Logo_Minist%C3%A8re_de_la_sant%C3%A9_Tunisie_%D8%AA%D9%88%D9%86%D8%B3_%D9%88%D8%B2%D8%A7%D8%B1%D8%A9_%D8%A7%D9%84%D8%B5%D8%AD%D8%A9.svg/1200px-Logo_Minist%C3%A8re_de_la_sant%C3%A9_Tunisie_%D8%AA%D9%88%D9%86%D8%B3_%D9%88%D8%B2%D8%A7%D8%B1%D8%A9_%D8%A7%D9%84%D8%B5%D8%AD%D8%A9.svg.png"),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                // Appel de la page de mise à jour du profil
                                Get.to(() => UpdateProfile())?.then((value) {
                                  // Mettre à jour l'image de profil après la mise à jour
                                  setState(() {});
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${data['nom']}" + " " + "${data['prenom']}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${data['email']}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  );

                }

                return CircularProgressIndicator.adaptive();
              }
              ),

          CustomListTile(
              Icons.home,
              'Acceuil',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => acceuil()))),
          CustomListTile(
              Icons.login,
              'S"inscrire',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()))),
          CustomListTile(
              Icons.tty,
              'Contacter nous',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => contact()))),
          CustomListTile(
              Icons.person,
              'Espace Citoyen',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => citoyen()))),
          CustomListTile(
              Icons.image,
              'Gallery ',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => gallery()))),
          CustomListTile(Icons.logout, 'SignOut', () => AuthService().LogOut()),
        ],
      ),

    );
  }
}
