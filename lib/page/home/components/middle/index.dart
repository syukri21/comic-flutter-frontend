import 'package:comic/util/normalization-directionality.dart';
import 'package:flutter/cupertino.dart';

import 'banner.dart';
import 'navigation.dart';
import 'new-comics.dart';
import 'popular-comics.dart';

class Middle extends StatelessWidget {
  const Middle({
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
