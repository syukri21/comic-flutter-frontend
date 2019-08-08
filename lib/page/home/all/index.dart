import 'package:comic/page/home/all/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class All extends StatelessWidget {
  const All({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        children: <Widget>[
          Appbar(),
          Body(),
        ],
      ),
    );
  }
}
