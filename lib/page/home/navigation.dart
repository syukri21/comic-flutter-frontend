import 'package:comic/util/position.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const menus = ["Category", "Popular", "Manga", "Manwha", "Isekai"];

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: menus
            .asMap()
            .map((i, menu) => MapEntry(
                i,
                NavigationItem(
                  menu: menu,
                  index: i,
                  length: menus.length,
                )))
            .values
            .toList(),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final menu;
  final index;
  final length;

  Margin margin;

  NavigationItem({Key key, @required this.menu, this.index, this.length})
      : super(key: key) {
    this.margin = Margin(index: this.index, length: this.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://i2.wp.com/kiryuu.co/wp-content/uploads/2019/06/I-Am-The-Sorcerer-King.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter),
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(169, 36, 47, 0.8),
            spreadRadius: -5,
            offset: Offset(0, 4),
            blurRadius: 15,
          ),
        ],
      ),
      child: Container(
          child: Text(menu, style: TextStyle(color: Colors.white)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(169, 36, 47, 0.4),
                  Color.fromRGBO(169, 36, 47, 0.8)
                ]),
          )),
      margin: EdgeInsets.only(
          bottom: 20, left: this.margin.left, right: this.margin.right),
    );
  }
}
