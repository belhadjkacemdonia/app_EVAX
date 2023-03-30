import 'package:flutter/material.dart';

import 'drawer.dart';


class citoyen_cin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Insert avec cin"),
        backgroundColor: Colors.red,),
      drawer: Mydrawer(),
        body: citoyen_avec_cin(),
    );
  }
}
class citoyen_avec_cin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(

           child:  Container(
            child:  Center(
              child:  Column(
                children : [
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  Text('Etape 1 : Données Générales',
                    style:  TextStyle(color: Colors.red, fontSize: 20.0),),
             Padding(padding: EdgeInsets.only(top: 30.0)),
                  TextField(
               decoration:  InputDecoration(
                 labelText: "Carte d'identité Nationale",
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
