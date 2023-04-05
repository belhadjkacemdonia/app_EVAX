import 'package:evax_app/inscrir.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'acceuil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}


final navigatorkey = GlobalKey<NavigatorState>();

final FirebaseAuth _auth = FirebaseAuth.instance;
final user = _auth.currentUser;


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(      navigatorKey: navigatorkey,

      theme: ThemeData(primarySwatch: Colors.red),
      home:  StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return acceuil();

          } else {
            return inscrir();
          }
        },
      ),
    );
  }
}