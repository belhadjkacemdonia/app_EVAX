import 'package:flutter/material.dart';

import 'citoyen_cin.dart';
import 'citoyen_etranger.dart';
import 'citoyen_sans_cin.dart';
import 'drawer.dart';

class inscrir extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Inscription"),
        backgroundColor: Colors.red,),
      drawer: Mydrawer(),
      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('BIENVENUE AU PORTAIL DE VACCINATION CONTRE LA COVID 19',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,fontSize: 20.0),
              ),


              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> citoyen_cin()
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black12,
                  ),

                  margin: EdgeInsets.only(bottom: 15, top: 15),
                  width: 400.0,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      'Citoyen titulaire d"une carte d"identité',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> citoyen_sans_cin()
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.only(bottom: 15),
                  width: 400.0,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      'Citoyen qui ne possède pas de carte',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> citoyen_etranger()
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.only(bottom: 15),
                  width: 400.0,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      'Citoyen Etranger',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}