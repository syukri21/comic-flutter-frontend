import 'package:comic/page/home/all/all-appbar.dart';
import 'package:comic/page/home/all/all-body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        children: <Widget>[
          AllAppbar(),
          AllBody(),
        ],
      ),
    );
  }
}
