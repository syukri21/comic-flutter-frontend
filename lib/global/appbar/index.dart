import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SilverAppBarComic extends StatelessWidget {
  const SilverAppBarComic({
    Key key,
    @required TabController controller,
    this.forceElevatedBool,
    this.hasBottom,
  })  : _controller = controller,
        super(key: key);

  final TabController _controller;
  final bool forceElevatedBool;
  final bool hasBottom;

  @override
  Widget build(BuildContext context) {
    return new SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: Theme.of(context).primaryColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: null,
        )
      ],
      title: Text(
        "MangaRee",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontFamily: "Fascinate",
        ),
        textAlign: TextAlign.center,
      ),
      bottom: _bottomAppBar(context),
    );
  }

  PreferredSize _bottomAppBar(BuildContext context) {
    if (!hasBottom) return null;
    return PreferredSize(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: TabBar(
          isScrollable: true,
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          tabs: <Widget>[
            Tab(text: 'Home'),
            Tab(text: 'All'),
            Tab(text: 'New Update'),
          ],
          controller: _controller,
        ),
      ),
      preferredSize: Size(null, 48),
    );
  }
}
