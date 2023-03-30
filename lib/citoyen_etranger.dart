import 'package:flutter/material.dart';
import 'drawer.dart';

class citoyen_etranger extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("citoyen_etranger"),
        backgroundColor: Colors.red,),
      drawer: Mydrawer(),
      body: Text(" citoyen_etranger"),
    );
  }
}

