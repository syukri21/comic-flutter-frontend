import 'package:flutter/material.dart';

class AppBarComic {
  static getAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: Color.fromRGBO(178, 37, 42, 1), fontFamily: "Fascinate"),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: Colors.black,
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.black,
          onPressed: () {},
        )
      ],
    );
  }
}
