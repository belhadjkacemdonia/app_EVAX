import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'acceuil.dart';
import 'drawer.dart';
class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController namemereController = TextEditingController();
  final TextEditingController namepereController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> updateProfile() async {
    if (
    nameController.text.isEmpty ||
        prenomController.text.isEmpty ||
        emailController.text.isEmpty
    ) {
      Get.snackbar("Required", "All fields are required !",
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.deepPurple,
          ),
          backgroundColor: Colors.white,
          colorText: Colors.red.shade800,
          snackPosition: SnackPosition.BOTTOM);
    }

    // Call the user's CollectionReference to add a new user
    return await users.doc(user!.uid).update({
      'nom': nameController.text,
      'prenom': prenomController.text,
      'email': emailController.text,

    }).then((value) {
      print("profile updated");
    }).catchError((error) => print("Fialed to update profile: $error"));
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
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

            return GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(

                  appBar: AppBar(
                    title: Text(
                      "Edit Profile",
                    ),
                  ),
                  body: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: prenomController,

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
                              controller: nameController,

                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "nom",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            TextFormField(
                              controller: emailController,

                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "email",
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
                                updateProfile().then((value) =>
                                    Get.to(acceuil()));
                                // print(_cinController.text.toString());
                                // print(_nameController.text.toString());
                                // print(_surnameController.text.toString());
                                // print(DateFormat.yMd().format(_birthDate!));
                                // print(_sex);
                                // print(user!.email);
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
                                    "Update Profile",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  )),
            );
          }
          return SizedBox();
        });
  }

}

