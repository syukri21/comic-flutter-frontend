import 'package:comic/page/home/components/for-you/index.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/left/index.dart';
import 'components/right/index.dart';

import 'package:comic/global/appbar/index.dart';

class HomePage extends StatefulWidget {
  final int navBarPosition;
  final String title;

  HomePage({Key key, @required this.title, this.navBarPosition: 1})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _controller;
  TabController _bottomTabController;
  ScrollController _scrollController;

  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    );
    _bottomTabController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    );
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        body: TabBarView(
          controller: _controller,
          children: <Widget>[ForYou(), Left(), Right()],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SilverAppBarComic(
                controller: _controller, forceElevatedBool: innerBoxIsScrolled),
          ];
        },
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          controller: _bottomTabController,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          indicatorWeight: 3,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.access_time)),
            Tab(icon: Icon(Icons.file_download)),
            Tab(icon: Icon(Icons.more_horiz)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scrollController.dispose();
    _bottomTabController.dispose();
  }
}
