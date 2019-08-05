import 'package:comic/util/normalization-directionality.dart';
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
    return NormalizationDirectionality(
      child: Container(
        child: ListView(
          children: <Widget>[
            BannerCarouselQuery(),
            NewComics(),
            PopularComics(),
          ],
        ),
      ),
    );
  }
}
