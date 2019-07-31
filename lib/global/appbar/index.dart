import 'package:flutter/material.dart';

class AppBarComic {
  static getAppBar(String title, context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontFamily: "Fascinate",
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      titleSpacing: 1,
      leading: IconButton(
        padding: EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        icon: Icon(Icons.menu),
        color: Colors.black,
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 16),
          icon: Icon(Icons.search),
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}
