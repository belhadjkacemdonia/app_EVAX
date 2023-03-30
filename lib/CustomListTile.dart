import 'package:flutter/material.dart';


class CustomListTile extends StatelessWidget{

  IconData icon;
  String text;
  final void Function()? onTap;

  CustomListTile(this.icon,this.text,this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
      child:Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))
        ),
        child: InkWell(
          splashColor: Colors.redAccent,
          onTap: onTap,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget> [
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text, style: TextStyle(
                          fontSize: 16.0
                      ),),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
