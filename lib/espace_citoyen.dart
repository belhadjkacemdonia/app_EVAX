import 'package:flutter/material.dart';

import 'drawer.dart';


class citoyen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("citoyen"),
        backgroundColor: Colors.red,),
      drawer: Mydrawer(),
      body: espace_citoyen(),

    );
  }
}
class espace_citoyen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
        child:  Center(
          child:  Column(
            children : [
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Text('Veuillez vous connecter à votre espace citoyen',
                style:  TextStyle(color: Colors.red, fontSize: 20.0),),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                decoration:  InputDecoration(
                  labelText: "Numéro d'inscription EVAX",
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