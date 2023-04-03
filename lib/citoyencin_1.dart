import 'package:flutter/material.dart';

import 'drawer.dart';


class citoyen_cin_e1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Insert avec cin"),
        backgroundColor: Colors.red,),
      drawer: Mydrawer(),
      body: inscrit_citoyen_cin(),
    );
  }
}
class inscrit_citoyen_cin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(

      child:  Container(
        child:  Center(
          child:  Column(
            children : [
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Text('Compléter votre inscription',
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
                  labelText: "Email",
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
