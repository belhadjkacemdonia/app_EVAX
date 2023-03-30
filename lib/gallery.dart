import 'package:flutter/material.dart';

import 'drawer.dart';


class gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "images/img1.jpeg",
      "images/img2.jpeg",
      "images/img3.jpeg",
      "images/img4.jpeg",
      "images/img5.jpeg",
      "images/img6.jpeg",
      "images/img7.jpeg",
      "images/img8.jpeg",
      "images/img9.jpeg",
      "images/img10.jpeg",
      "images/img12.jpeg",
      "images/img13.jpeg",

    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Gallery"),
          backgroundColor: Colors.red,),
        drawer: Mydrawer(),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(images[index]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}