import 'package:carousel_slider/carousel_slider.dart';
import 'package:comic/graphql/query/comics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
      document: readComics,
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
      aspectRatio: 6 / 4,
      viewportFraction: 0.6,
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
      return LinearGradient(
        colors: <Color>[
          Theme.of(context).colorScheme.secondaryVariant.withOpacity(.5),
          Theme.of(context).colorScheme.secondaryVariant.withOpacity(.5),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
    }

    return LinearGradient(
      colors: <Color>[
        Theme.of(context).primaryColor.withOpacity(.6),
        Colors.transparent
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }

  get title {
    if (!isCenter) return null;

    return Text(
      item["title"].replaceAll("Bahasa Indonesia", ""),
      style: TextStyle(color: Colors.white, fontFamily: "Farro"),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: -10,
                offset: Offset(0, 20),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(item["image"]),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: gradientColor(context),
            ),
            padding: EdgeInsets.all(10),
            child: Align(
              child: title,
              alignment: Alignment.bottomCenter,
            ),
          ),
        );
      },
    );
  }
}
