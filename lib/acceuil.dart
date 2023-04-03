import 'package:evax_app/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'inscrir.dart';


class acceuil extends StatelessWidget {
  final List<String> imageList = [

    "https://i0.wp.com/lapresse.tn/wp-content/uploads/2021/12/vaccin-covid3.jpg?fit=1200%2C675&ssl=1",
    "https://madrassatii.com/wp-content/uploads/2021/10/%D8%AC%D9%88%D8%A7%D8%B2-%D8%A7%D9%84%D8%AA%D9%84%D9%82%D9%8A%D8%AD-%D9%83%D9%88%D9%81%D9%8A%D8%AF-scaled.jpg",

  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Acceuil"),
        backgroundColor: Colors.red,),

      drawer: Mydrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  ),
                  items: imageList.map((e) =>
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(e,
                              width: 200,
                              height: 400,
                              fit: BoxFit.cover,)
                          ],
                        ),
                      )).toList(),
                ),
              ),
              SizedBox(height: 20.0,),
               Text('BIENVENUE AU PORTAIL DE VACCINATION CONTRE LA COVID-19',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18.0),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> inscrir()
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red,
                  ),

                  margin: EdgeInsets.only(bottom: 15, top: 30),
                  width: 400.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'INSCRIVEZ-VOUS À LA CAMPAGNE DE VACCINATION',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> inscrir()
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                  ),

                  margin: EdgeInsets.only(bottom: 15, top: 5),
                  width: 400.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'LISTE DES CABINETS MÉDICAUX ET LABORATOIRES DE VACCINATION',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 200.0,),







            ],

          ),
        ),
      ),
    );
  }
}