import 'package:comic/graphql/query/comics.dart';
import 'package:comic/page/home/list-comic.dart';
import 'package:comic/page/home/list-title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class PopularComics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          ListTitle(title: "Popular on Manga Ree"),
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
    return Query(
      options: QueryOptions(document: readComics, variables: {
        'first': 10,
        'orderBy': 'rating_DESC',
        "firstChapter": 1
      }),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());

        if (result.loading) return Text("Loading..");

        List comics = result.data["comics"];

        return Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Comic(
                index: index,
                item: comics[index],
                length: comics.length,
              );
            },
            itemCount: comics.length,
          ),
        );
      },
    );
  }
}
