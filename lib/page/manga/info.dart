import 'package:comic/page/manga/info/anotherFact.dart';
import 'package:flutter/material.dart';

import 'info/author.dart';
import 'info/genres.dart';
import 'info/statistic.dart';
import 'info/summary.dart';

class MangaInfo extends StatefulWidget {
  const MangaInfo({
    Key key,
    @required this.comic,
    @required this.genres,
  }) : super(key: key);

  final comic;
  final genres;

  @override
  _MangaInfoState createState() => _MangaInfoState();
}

class _MangaInfoState extends State<MangaInfo>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimation();
  }

  void prepareAnimation() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Animation curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        print(animation);
        setState(() {});
      });
  }

  bool isCollapse = true;

  void toggleHideAnimation() {
    if (isCollapse) {
      expandController.forward();
      setState(() {
        isCollapse = false;
      });
    } else {
      expandController.reverse();
      setState(() {
        isCollapse = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Summary(comic: widget.comic),
        Genres(genres: widget.genres),
        FlatButton(
          child: Text(isCollapse ? "Show" : "Hide"),
          onPressed: toggleHideAnimation,
        ),
        SizeTransition(
          sizeFactor: animation,
          child: Wrap(
            children: <Widget>[
              Statistic(comic: widget.comic),
              Author(comic: widget.comic),
              AnotherFact(comic: widget.comic),
            ],
          ),
        ),
      ],
    );
  }
}
