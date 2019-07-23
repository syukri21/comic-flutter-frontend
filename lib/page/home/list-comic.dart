import 'package:comic/util/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comic extends StatelessWidget {
  final item;
  final index;
  final length;
  Margin margin;

  Comic({Key key, this.item, this.index, this.length}) : super(key: key) {
    this.margin = Margin(index: this.index, length: this.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: this.margin.left,
        right: this.margin.right,
        top: 0,
        bottom: 9,
      ),
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 4),
            color: Color.fromRGBO(0, 0, 0, 0.3),
            spreadRadius: 0,
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(this.item["image"]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
