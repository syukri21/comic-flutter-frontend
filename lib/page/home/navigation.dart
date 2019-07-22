import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const menus = [
  "Category",
  "Popular",
  "Manga",
  "Manwha",
  "Isekai"
];


var boxDecoration =  BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(169, 36, 47, 0.4),
        Color.fromRGBO(169, 36, 47, 0.8)
      ]
    ),
);

          


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
            image: DecorationImage(
              image: NetworkImage("https://i.pinimg.com/originals/c5/5a/3d/c55a3d18e62cb0397606d46673fa7172.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color:  Color.fromRGBO(169, 36, 47, 0.8),
                spreadRadius: -5,
                offset: Offset(0, 4),
                blurRadius: 15,
              ),
            ],
          ),
          child: Container(
            child: Text(i, style: TextStyle(
              color: Colors.white
            )),
            alignment: Alignment.center,
            decoration: boxDecoration
          ),
          margin: EdgeInsets.only(left: 18, bottom: 20 ),
        )).toList(),
      ),
    );
  }
}
