import 'package:comic/graphql/query/comic-with-chapter.dart';
import 'package:comic/page/home/list-comic.dart';
import 'package:comic/page/home/list-title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class NewComics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          ListTitle(title: "New Comics"),
          ListComicsQuery(),
        ],
      ),
    );
  }
}

class ListComicsQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: readComicWithChapters,
        variables: {'first': 10, 'orderBy': 'updateOn_DESC', 'firstChapter': 1},
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());

        if (result.loading) return Text('Loading');

        List comics = result.data["comics"];

        return ListComics(
          comics: comics,
        );
      },
    );
  }
}

class ListComics extends StatelessWidget {
  final comics;

  const ListComics({Key key, this.comics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: comics.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Comic(
            item: this.comics[index],
            length: this.comics.length,
            index: index,
          );
        },
      ),
    );
  }
}
