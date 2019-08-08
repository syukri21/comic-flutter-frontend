import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'banner.dart';
import 'new-comics.dart';
import 'popular-comics.dart';

class ForYou extends StatelessWidget {
  const ForYou({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        children: <Widget>[
          BannerCarouselQuery(),
          NewComics(),
          PopularComics(),
        ],
      ),
    );
  }
}
