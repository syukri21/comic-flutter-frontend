import 'package:flutter/material.dart';

class AppBarComic {
  static getAppBar(String title, context, isRtl) {
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
      leading: handleIsRtl(isRtl, 0),
      actions: <Widget>[
        handleIsRtl(isRtl, 1),
      ],
    );
  }

  static handleIsRtl(isRtl, type) {
    IconButton menuIcon = IconButton(
      padding: EdgeInsets.only(left: 16),
      alignment: Alignment.centerLeft,
      icon: Icon(Icons.menu),
      color: Colors.black,
      onPressed: () {},
    );
    IconButton searchIcon = IconButton(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 16),
      icon: Icon(Icons.search),
      color: Colors.black,
      onPressed: () {},
    );

    if (type == 0) {
      if (isRtl) return searchIcon;
      return menuIcon;
    }
    if (!isRtl) return searchIcon;
    return menuIcon;
  }
}
