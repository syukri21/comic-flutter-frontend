import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const menus = [
  "Category",
  "Popular",
  "Manga",
  "Manwha",
  "Isekai"
];

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( top: 10, bottom: 10),
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: menus.map((i) => Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(

            boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .5),
                  spreadRadius: -5,
                  offset: Offset(0, 10),
                  blurRadius: 15,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(169, 36, 47, 0.8),
                Color.fromRGBO(169, 36, 47, 1)
              ]
            ),
          ),
          child: Center(
            child:Text(i, style: TextStyle(color: Colors.white),),
          ),
          margin: EdgeInsets.only(left: 18, bottom: 20 ),
        )).toList(),
      ),
    );
  }
}
