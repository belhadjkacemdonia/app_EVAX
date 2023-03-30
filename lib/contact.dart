import 'package:flutter/material.dart';

import 'drawer.dart';

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Contacter_nous"),
          backgroundColor: Colors.red,),
      drawer: Mydrawer(),
      body: MyCardWidget(),
    );
  }
}
/// This is the stateless widget that the main application instantiates.
class MyCardWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 400,
          height: 600,
          padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
    ),
            color: Colors.black12,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                ListTile(
                  title: Text('Contactez nous pour plus d"information',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)
    ),
    ),
                ListTile(
                  title: Text('Appel Gratuit : Centre d"appel disponible Du lundi au Vendredi de 09h à 17h.',
        ),
      ),
                ListTile(
                  leading: Icon(Icons.tty, size: 30),
                  title: Text('+(216) 8010 20 21',
                      style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),
                ListTile(
                  leading: Icon(Icons.web, size: 30),
                  title: Text('www.evax.tn',
                      style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),
                ListTile(
                  title: Text('Voulez-vous vous inscrire ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),
                ListTile(
                  title: Text('Pour vous inscrire vous pouvez :',
        ),
      ),
                ListTile(
                  leading: Icon(Icons.tty, size: 30),
                  title: Text('Composer le #2021*',
                      style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),
                ListTile(
                  leading: Icon(Icons.sms, size: 30),
                  title: Text('Envoyer un SMS à 85 355',
                      style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),
                ListTile(
                  leading: Icon(Icons.add_call, size: 30),
                  title: Text('Appeler le 8010 2021 du lundi au vendredi de 09h à 17h',
                      style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),

    ],
    ),
    ),
        )
    );
  }
}
