import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comic/util/margin.dart';

import 'package:comic/util/dummy.dart' as dummy;

class PopularComics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          Title(),
          ListComics(),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 5, left: 18, right: 18),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Popular on Manga Ree"),
            GestureDetector(
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class ListComics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: dummy.comics
            .asMap()
            .map((i, item) => MapEntry(
                i,
                Comic(
                  item: item,
                  index: i,
                  length: dummy.comics.length,
                )))
            .values
            .toList(),
      ),
    );
  }
}

class Comic extends StatelessWidget {
  final item;
  final index;
  final length;
  Margin margin;

  Comic({Key key, this.item, this.index, this.length}) : super(key: key) {
    this.margin = Margin(index: this.index, length: this.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: this.margin.left, right: this.margin.right),
      child: Image(
        image: NetworkImage(this.item["image"]),
      ),
    );
  }
}
