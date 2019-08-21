import 'package:flutter/material.dart';

import 'info/genres.dart';
import 'info/statistic.dart';
import 'info/summary.dart';

class MangaInfo extends StatelessWidget {
  const MangaInfo({
    Key key,
    @required this.comic,
    @required this.genres,
  }) : super(key: key);

  final comic;
  final genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Summary(comic: comic),
        Genres(genres: genres),
        Statistic(comic: comic),
      ],
    );
  }
}
