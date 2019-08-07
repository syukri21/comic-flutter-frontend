import 'package:comic/graphql/query/count-comics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AllAppbar extends StatelessWidget {
  const AllAppbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CountMangaQuery(),
          GestureDetector(
            child: Container(
              child: Icon(
                Icons.filter_list,
                color: Theme.of(context).colorScheme.secondaryVariant,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountManga extends StatelessWidget {
  final String count;
  const CountManga({
    Key key,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      """$count manga""",
      style: TextStyle(
        fontFamily: "Farro",
        fontSize: 14,
        color: Theme.of(context).colorScheme.secondaryVariant,
      ),
    );
  }
}

class CountMangaQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: readCountsComic,
        variables: {"where": null},
        fetchPolicy: FetchPolicy.cacheFirst,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("");
        int count = result.data["countComics"];
        return CountManga(count: count.toString());
      },
    );
  }
}
