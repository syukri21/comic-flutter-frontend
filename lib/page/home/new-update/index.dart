import 'package:comic/page/home/new-update/appbar.dart';
import 'package:comic/page/home/new-update/body.dart';
import 'package:flutter/material.dart';

class NewUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: <Widget>[Appbar(), Body()],
      ),
    );
  }
}
