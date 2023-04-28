import 'package:evax_app/gallery.dart';
import 'package:evax_app/pass_europ.dart';
import 'package:evax_app/pass_vacc.dart';
import 'package:evax_app/reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'certif_vacc.dart';
import 'drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'liste_pharmacie.dart';
import 'login.dart';

class acceuil extends StatelessWidget {
  final List<String> imageList = [
    "https://i0.wp.com/lapresse.tn/wp-content/uploads/2021/12/vaccin-covid3.jpg?fit=1200%2C675&ssl=1",
    "https://madrassatii.com/wp-content/uploads/2021/10/%D8%AC%D9%88%D8%A7%D8%B2-%D8%A7%D9%84%D8%AA%D9%84%D9%82%D9%8A%D8%AD-%D9%83%D9%88%D9%81%D9%8A%D8%AF-scaled.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Acceuil"),
        backgroundColor: Colors.red,
      ),
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
                  items: imageList
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Image.network(
                                  e,
                                  width: 200,
                                  height: 400,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'BIENVENUE AU PORTAIL DE VACCINATION CONTRE LA COVID-19',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18.0),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => liste_pharmacie()));
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
                      'LISTE DES PHARMACIES',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => reservation()));
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
                      'MES RESERVATION',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => certif_vacc()));
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red.shade300,
                    ),
                    margin: EdgeInsets.only(bottom: 15, top: 30),
                    width: 400.0,
                    height: 120.0,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.vaccines, color: Colors.white, size: 30),
                          SizedBox(width: 5),
                          Text(
                            'Consulter votre certificat de vaccination',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pass_vacc()));
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red.shade400,
                    ),
                    margin: EdgeInsets.only(bottom: 15, top: 30),
                    width: 400.0,
                    height: 120.0,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.paste_sharp,
                              color: Colors.white, size: 30),
                          SizedBox(width: 5),
                          Text(
                            'Consulter votre Pass vaccinal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pass_europ()));
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red,
                    ),
                    margin: EdgeInsets.only(bottom: 15, top: 30),
                    width: 400.0,
                    height: 120.0,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.paste_sharp,
                              color: Colors.white, size: 30),
                          SizedBox(width: 5),
                          Text(
                            'Consulter votre Pass vaccinal Européen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
