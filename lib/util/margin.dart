import 'package:flutter/material.dart';

class Margin {
  double left = 10;
  double right = 0;

  final index;
  final length;

  Margin({this.index, this.length, IconButton child}) {
    if (this.index == 0) {
      this.left = 18.0;
    } else if (this.index == (this.length - 1)) {
      this.right = 18.0;
    }
  }
}
