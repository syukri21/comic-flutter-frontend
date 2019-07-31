import 'package:comic/global/appbar/index.dart';
import 'package:comic/global/bottom-navigation/index.dart';

import 'package:comic/page/home/bloc/bloc.dart';

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

class _HomePageBlocState extends State<HomePageBloc> {
  TextDirection lastDirection = TextDirection.ltr;

  IconData get showIcon {
    IconData currentIcon;

    switch (widget.navBarPosition) {
      case 0:
        currentIcon = Icons.pages;
        break;
      case 1:
        currentIcon = Icons.add;
        break;
      default:
        currentIcon = Icons.people;
    }

    return currentIcon;
  }

  TextDirection get textDirection {
    TextDirection direction;
    if (widget.navBarPosition == 0) {
      direction = TextDirection.rtl;
    } else if (widget.navBarPosition == 1) {
      direction = lastDirection;
    } else {
      direction = TextDirection.ltr;
    }
    lastDirection = direction;
    return direction;
  }

  FloatingActionButtonLocation get positionDocked {
    if (widget.navBarPosition == 1)
      return FloatingActionButtonLocation.centerDocked;
    return FloatingActionButtonLocation.endDocked;
  }

  get isRtl {
    return textDirection == TextDirection.rtl;
  }

  get callComponent {
    switch (widget.navBarPosition) {
      case 0:
        return Left();
      case 1:
        return Middle();
      case 2:
        return Right();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      child: Scaffold(
        appBar: AppBarComic.getAppBar(widget.title, context, isRtl),
        body: callComponent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: null,
          child: Icon(showIcon),
          mini: true,
        ),
        bottomNavigationBar: BottomNavigation(
          navBarPosition: widget.navBarPosition,
        ),
        floatingActionButtonLocation: positionDocked,
      ),
      textDirection: textDirection,
    );
  }
}
