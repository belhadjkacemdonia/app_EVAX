import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomListTile.dart';
import 'gallery.dart';
import 'acceuil.dart';
import 'contact.dart';
import 'espace_citoyen.dart';
import 'inscrir.dart';
import 'inscrit_pharmacie.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(    //menu
      child: ListView(
        children: <Widget>[
          DrawerHeader(        //partie photo
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.red,
                    Colors.red,
                  ])
              ),
              child: Container(
                child: Column(
                  children:<Widget> [
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      child: Padding(padding: EdgeInsets.all(10.0),
                        child: Image.asset('images/ministere1.png',width: 80,height: 80,),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7.0),child: Text('EVAX',style: TextStyle(color: Colors.white,fontSize: 20.0) ,),)
                  ],
                ),
              )),
          CustomListTile(Icons.home,'Acceuil',()=> {Navigator.push(context, MaterialPageRoute(builder: (context)=> acceuil()
          ))
          }),
          CustomListTile(Icons.login,'S"inscrire',()=>{ Navigator.push(context, MaterialPageRoute(builder: (context)=> inscrir()
          ))}),
          CustomListTile(Icons.tty,'Contacter nous',()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=> contact()
          ))}),
          CustomListTile(Icons.local_pharmacy,'Inscription pharmacie',()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=> inscrit_pharmacie()
          ))}),
          CustomListTile(Icons.person,'Espace Citoyen',()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=> citoyen()
          ))}),
          CustomListTile(Icons.image,'Gallery ',()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=> gallery()
          ))}),
        ],
      ),
    );
  }
}