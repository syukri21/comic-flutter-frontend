import 'package:comic/global/appbar/index.dart';
import 'package:comic/global/bottom-navigation/index.dart';

import 'package:comic/page/home/bloc/bloc.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/left/index.dart';
import 'components/middle/index.dart';
import 'components/right/index.dart';

class HomePage extends StatelessWidget {
  final bottomNavbarBloc = BottomnavbarBloc();
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BottomnavbarBloc, BottomnavbarState>(
      listener: (BuildContext context, state) {},
      child: BlocBuilder<BottomnavbarBloc, BottomnavbarState>(
        builder: (context, state) {
          int position = 1;

          if (state is BottomnavbarChanged) {
            position = state.position;
          }

          return HomePageBloc(
            title: title,
            navBarPosition: position,
          );
        },
      ),
    );
  }
}

class HomePageBloc extends StatefulWidget {
  final int navBarPosition;
  final String title;

  HomePageBloc({Key key, @required this.title, this.navBarPosition: 1})
      : super(key: key);

  @override
  _HomePageBlocState createState() => _HomePageBlocState();
}

class _HomePageBlocState extends State<HomePageBloc>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComic.getAppBar(widget.title, context),
      body: TabBarView(
        dragStartBehavior: DragStartBehavior.down,
        controller: _controller,
        children: <Widget>[Middle(), Left(), Right()],
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          controller: _controller,
          labelColor: Theme.of(context).primaryColor,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.access_time)),
            Tab(icon: Icon(Icons.accessibility)),
            Tab(icon: Icon(Icons.account_box)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
