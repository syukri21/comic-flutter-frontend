import 'package:flutter/cupertino.dart';

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
