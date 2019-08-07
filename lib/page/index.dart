import 'package:comic/page/bookmark/index.dart';
import 'package:comic/page/download/index.dart';
import 'package:comic/page/history/index.dart';
import 'package:comic/page/settings/index.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:comic/global/appbar/index.dart';

import 'home/index.dart';

class Pages extends StatefulWidget {
  Pages({Key key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> with TickerProviderStateMixin {
  TabController _controller;
  TabController _bottomTabController;
  ScrollController _scrollController;
  PageController _pageController;

  int _currentIndex = 0;

  List<Widget> get tabScreens => [
        HomePage(controller: _controller),
        Bookmark(),
        History(),
        Download(),
        Settings(),
      ];

  void _handleChangeCurrentIndex(int n) {
    setState(() {
      _currentIndex = n;
    });
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        n,
        duration: const Duration(milliseconds: 400),
        curve: Curves.slowMiddle,
      );
    }
  }

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
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          body: tabScreens[_currentIndex],
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SilverAppBarComic(
                controller: _controller,
                forceElevatedBool: innerBoxIsScrolled,
              ),
            ];
          },
        ),
        bottomNavigationBar: new ComicBottomNavigationBar(
          currentIndex: _currentIndex,
          handleChangeCurrentIndex: _handleChangeCurrentIndex,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _bottomTabController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}

class ComicBottomNavigationBar extends StatelessWidget {
  final handleChangeCurrentIndex;
  final int _currentIndex;

  const ComicBottomNavigationBar({
    Key key,
    @required int currentIndex,
    this.handleChangeCurrentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: handleChangeCurrentIndex,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text(
              "Bookmark",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text(
              "History",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download),
            title: Text(
              "Download",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          )
        ],
      ),
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
