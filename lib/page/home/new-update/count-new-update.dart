import 'package:comic/global/count-manga/index.dart';
import 'package:comic/graphql/query/count-comics.dart';
import 'package:comic/helper/date.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountQuery();
  }
}

class CountQuery extends StatelessWidget {
  const CountQuery({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
          document: readCountsComic,
          variables: {
            "where": {"updateOn_gt": GetDate().lastDays(1)}
          },
          fetchPolicy: FetchPolicy.cacheFirst),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return CountBuilder(countComics: 0);

        int countComics = result.data["countComics"];

        return CountBuilder(countComics: countComics);
      },
    );
  }
}

class CountBuilder extends StatelessWidget {
  const CountBuilder({Key key, this.countComics}) : super(key: key);

  final int countComics;

  @override
  Widget build(BuildContext context) {
    return CountManga(count: countComics.toString());
  }
}
