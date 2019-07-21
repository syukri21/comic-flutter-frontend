import 'package:comic/global/appbar/index.dart';
import 'package:comic/page/home/banner.dart';
import 'package:comic/page/home/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComic.getAppBar(widget.title),
        body: Container(
          child: Column(
            children: <Widget>[
              BannerCarousel(),
              Navigation(),
            ],
          ),
        ));
  }
}
