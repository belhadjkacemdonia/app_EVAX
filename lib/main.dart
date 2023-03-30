import 'package:flutter/material.dart';
import 'acceuil.dart';

void main() {
  runApp(MaterialApp(
    title: 'evax',
    home: MyApp(),   //awel page bch nraniha
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: acceuil(),
    );
  }
}