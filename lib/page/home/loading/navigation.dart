import 'package:comic/util/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const menus = [1, 2, 3, 4, 5];

class LoadingNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: menus
          .map(
            (i) => LoadingNavigationItem(
              index: i,
              length: menus.length,
            ),
          )
          .toList(),
    );
  }
}

class LoadingNavigationItem extends StatelessWidget {
  final index;
  final length;

  Margin get margin {
    return Margin(index: this.index, length: this.length);
  }

  LoadingNavigationItem({Key key, this.index, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      margin: EdgeInsets.only(
        bottom: 10,
        left: this.margin.left,
        right: this.margin.right,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white30),
        ),
      ),
    );
  }
}
