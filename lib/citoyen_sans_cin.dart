import 'package:flutter/material.dart';

import 'drawer.dart';


class citoyen_sans_cin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("citoyen_sans_cin"),
        backgroundColor: Colors.red,),
      drawer: Mydrawer(),
        body: citoyen_sanscin(),

    );
  }
}
class citoyen_sanscin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
        child:  SingleChildScrollView(
          child:  Column(
            children : [
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Text('Etape 1 : Données Générales',
                style:  TextStyle(color: Colors.red, fontSize: 20.0),),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "Prénom",
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
                  labelText: "Nom",
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
                  labelText: "Date de Naissance",
                  border:  OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(25.0),
                    borderSide:  BorderSide(
                    ),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              ButtonRadio(),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "Nom du père",
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
                  labelText: "Nom du grand père",
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
                  labelText: "Nom de la mère",
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
                  labelText: "Prénom mère",
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
      ),
    );
  }
}

class ButtonRadio extends StatefulWidget {
  @override
  _MyButtonRadio createState() => _MyButtonRadio();
}
enum Gender { Homme, Femme }

class _MyButtonRadio extends State<ButtonRadio> {
  Gender defaultValue = Gender.Femme;
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            "Genre",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          //Radio Button via ListTile
          ListTile(
            leading: Radio(
              value: Gender.Homme,
              groupValue: defaultValue,
              onChanged: (value) {
                setState(() {
                  gender = "Homme";
                });
              },
            ),
            title: Text("Homme"),
          ),
          ListTile(
            leading: Radio(
              value: Gender.Femme,
              groupValue: defaultValue,
              onChanged: (value) {
                setState(() {
                  gender = "Femme";
                });
              },
            ),
            title: Text("Femme"),
          ),




        ],
      ),
    );
  }
}