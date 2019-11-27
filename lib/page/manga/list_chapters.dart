import 'package:flutter/material.dart';

class ListChapters extends StatelessWidget {
  const ListChapters({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TableCell(
            child: Row(
      children: <Widget>[
        Text("Hello"),
        Text("Hello"),
        Text("Hello"),
        Text("Hello"),
      ],
    )));
  }
}
