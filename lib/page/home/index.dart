import 'package:comic/global/appbar/index.dart';
import 'package:comic/page/home/banner.dart';
import 'package:comic/page/home/navigation.dart';
import 'package:comic/page/home/new-comics.dart';
import 'package:comic/page/home/popular-comics.dart';
import 'package:comic/util/normalization-directionality.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navBarPosition = 1;
  TextDirection lastDirection;

  @override
  void initState() {
    super.initState();
    lastDirection = TextDirection.ltr;
  }

  showIcon() {
    IconData currentIcon;

    switch (navBarPosition) {
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

  textDirection() {
    TextDirection direction;
    if (navBarPosition == 0) {
      direction = TextDirection.rtl;
    } else if (navBarPosition == 1) {
      direction = lastDirection;
    } else {
      direction = TextDirection.ltr;
    }
    lastDirection = direction;
    return direction;
  }

  positionDocked() {
    if (navBarPosition == 1) return FloatingActionButtonLocation.centerDocked;
    return FloatingActionButtonLocation.endDocked;
  }

  _handleChangePosition(int i) {
    return () => setState(() => {navBarPosition = i});
  }

  get isRtl {
    return textDirection() == TextDirection.rtl;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      child: Scaffold(
        appBar: AppBarComic.getAppBar(widget.title, context, isRtl),
        body: _home(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: null,
          child: Icon(showIcon()),
          mini: true,
        ),
        bottomNavigationBar: _bottomNavigationBar(
          navBarPosition: navBarPosition,
          handleChangePosition: _handleChangePosition,
        ),
        floatingActionButtonLocation: positionDocked(),
      ),
      textDirection: textDirection(),
    );
  }
}

class _home extends StatelessWidget {
  const _home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalizationDirectionality(
      child: Container(
        child: ListView(
          children: <Widget>[
            BannerCarouselQuery(),
            Navigation(),
            NewComics(),
            PopularComics(),
          ],
        ),
      ),
    );
  }
}

class _bottomNavigationBar extends StatelessWidget {
  const _bottomNavigationBar({
    Key key,
    @required this.navBarPosition,
    this.handleChangePosition,
  }) : super(key: key);

  final int navBarPosition;
  final handleChangePosition;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: Theme.of(context).primaryColor,
      child: NormalizationDirectionality(
        child: Padding(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _listIcon(context),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }

  List<Widget> _listIcon(BuildContext context) {
    return <Widget>[
      IconButton(
        color: Theme.of(context).primaryTextTheme.button.color,
        icon: Icon(navBarPosition != 0 ? Icons.pages : null),
        onPressed: handleChangePosition(0),
      ),
      IconButton(
        color: Theme.of(context).primaryTextTheme.button.color,
        icon: Icon(navBarPosition != 1 ? Icons.add : null),
        onPressed: handleChangePosition(1),
      ),
      IconButton(
        color: Theme.of(context).primaryTextTheme.button.color,
        icon: Icon(navBarPosition != 2 ? Icons.people : null),
        onPressed: handleChangePosition(2),
      ),
    ];
  }
}
