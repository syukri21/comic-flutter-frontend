import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:comic/graphql/query/comics-on-banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'banner-item.dart';

class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BannerCarouselQuery();
  }
}

class BannerCarouselQuery extends StatelessWidget {
  final builder;

  const BannerCarouselQuery({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildQuery();
  }

  Query buildQuery() {
    return Query(
      options: queryOptions(),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("Loading");

        List comics = result.data["comics"];
        return BannerCarousel(comics: comics);
      },
    );
  }

  QueryOptions queryOptions() {
    return QueryOptions(
      document: comicsOnBanner,
      variables: {
        'first': 4,
        'orderBy': 'hits_DESC',
      },
    );
  }
}

class BannerCarousel extends StatefulWidget {
  final comics;

  const BannerCarousel({Key key, this.comics}) : super(key: key);

  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int centerIndex = 0;

  void _handlePageChanged(e) {
    setState(() {
      centerIndex = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = -1;
    return CarouselSlider(
      aspectRatio: 1.66,
      viewportFraction: 0.95,
      initialPage: 0,
      onPageChanged: _handlePageChanged,
      enlargeCenterPage: true,
      items: this.widget.comics.map<Widget>((item) {
        index = index + 1;
        return BannerCarauselItem(
            item: item, index: index, isCenter: _isCenter(index));
      }).toList(),
    );
  }

  bool _isCenter(int index) {
    return index == this.centerIndex;
  }
}

class BannerCarauselItem extends StatelessWidget {
  final item;
  final isCenter;
  final index;

  const BannerCarauselItem({
    Key key,
    this.item,
    this.index,
    this.isCenter,
  }) : super(key: key);

  gradientColor(context) {
    if (!isCenter) {
      return null;
    }

    return LinearGradient(
      stops: <double>[0.17, 0.83],
      colors: <Color>[
        Colors.transparent,
        Theme.of(context).primaryColor.withOpacity(1),
      ],
      begin: Alignment.centerRight,
      end: Alignment.center,
    );
  }

  get title {
    if (!isCenter) return null;
    return new BannerItem(item: item);
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      useOldImageOnUrlChange: true,
      imageBuilder: (BuildContext context, ImageProvider provider) => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.5),
              spreadRadius: -10,
              offset: const Offset(0, 20),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: provider,
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerRight,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: gradientColor(context),
          ),
          padding: const EdgeInsets.all(10),
          child: Align(
            child: title,
            alignment: Alignment.bottomLeft,
          ),
        ),
      ),
      imageUrl: item["image"],
    );
  }
}
