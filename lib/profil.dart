import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';


class profil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("profil"),
        backgroundColor: Colors.red,),
      drawer: Mydrawer(),


    );
  }
}