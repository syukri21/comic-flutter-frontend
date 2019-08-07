import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'util.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  final item;

  String get title {
    return this.item["title"].replaceAll("Bahasa Indonesia", "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.bookmark_border,
                    color: Theme.of(context).textSelectionColor,
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.favorite_border,
                    color: Color.fromRGBO(169, 36, 47, 0.6),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 80,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    item["synopsis"],
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.6),
                      fontSize: 10,
                    ),
                    maxLines: 6,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.left,
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      getYearFromString(item["released"]),
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SmoothStarRating(
                allowHalfRating: true,
                starCount: 5,
                rating: item["rating"] / 2,
                size: 20.0,
                color: Colors.yellowAccent,
                borderColor: Colors.yellowAccent.withOpacity(0.7),
                spacing: 0.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
