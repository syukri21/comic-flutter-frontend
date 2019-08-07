import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/for-you/index.dart';
import 'components/left/index.dart';
import 'components/right/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required TabController controller,
  })  : _controller = controller,
        super(key: key);

  final TabController _controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _controller,
      children: <Widget>[ForYou(), Left(), Right()],
    );
  }
}
