import 'package:flutter/material.dart';

import 'drawer.dart';


class inscrit_pharmacie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("inscription pharmacie"),
      backgroundColor: Colors.red,),
        drawer: Mydrawer(),
    body: _inscritpharmacie()

    );
  }
}
class _inscritpharmacie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(

      child:  SingleChildScrollView(
          child:  Column(
            children : [
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Text('Espace dediée pour les pharmacies et les pharmaciens',
                style:  TextStyle(color: Colors.red, fontSize: 20.0),),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "CNom de la pharmacie",
                  border:  OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(25.0),
                    borderSide:  BorderSide(
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "Numéro d'inscription de la pharmacie",
                  border:  OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(25.0),
                    borderSide:  BorderSide(
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "Numéro téléphonede la pharmacie",
                  border:  OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(25.0),
                    borderSide:  BorderSide(
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "Numéro téléphone du pharmacien",
                  border:  OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(25.0),
                    borderSide:  BorderSide(
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),

              MyButtonRadio(),

              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "Adresse de la pharmacie",
                  border:  OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(25.0),
                    borderSide:  BorderSide(
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "Cin du pharmacien",
                  border:  OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(25.0),
                    borderSide:  BorderSide(
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 30.0)),
              ButtonTheme(
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('Confirmer',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                  color: Colors.red,


                ),
              ),
            ],
          ),
        ),

    );
  }
}

class MyButtonRadio extends StatefulWidget {
  @override
  _MyButtonRadio createState() => _MyButtonRadio();
}
enum Gender { Jour, Nuit }

class _MyButtonRadio extends State<MyButtonRadio> {
  Gender defaultValue = Gender.Nuit;
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Radio Button via ListTile
          ListTile(
            leading: Radio(
              value: Gender.Jour,
              groupValue: defaultValue,
              onChanged: (value) {
                setState(() {
                  gender = "Pharmacie de jour";
                });
              },
            ),
            title: Text("Pharmacie de jour"),
          ),
          ListTile(
            leading: Radio(
              value: Gender.Nuit,
              groupValue: defaultValue,
              onChanged: (value) {
                setState(() {
                  gender = "Pharmacie de nuit";
                });
              },
            ),
            title: Text("Pharmacie de nuit"),
          ),




        ],
      ),
    );
  }
}
