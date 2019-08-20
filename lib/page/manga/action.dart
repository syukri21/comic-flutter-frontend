import 'package:comic/page/manga/queryCountChapters.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MangaAction extends StatelessWidget {
  final String comicId;

  const MangaAction({
    Key key,
    this.comicId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MangaActionQuery(comicId: comicId);
  }
}

class MangaActionQuery extends StatelessWidget {
  final String comicId;

  const MangaActionQuery({Key key, this.comicId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(comicId);
    return Query(
      options: QueryOptions(document: queryCountChapters, variables: {
        "where": {
          "comic": {"id": comicId}
        }
      }),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("");
        int countChapters = result.data["countChapters"];
        return MangaActionBuilder(countChapters: countChapters);
      },
    );
  }
}

class MangaActionBuilder extends StatelessWidget {
  final int countChapters;

  const MangaActionBuilder({Key key, this.countChapters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        FlatButton(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.play_arrow,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              Text("Read"),
            ],
          ),
          onPressed: null,
        ),
        FlatButton(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.list,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              Text("$countChapters Chapter"),
            ],
          ),
          onPressed: null,
        ),
        FlatButton(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              Text("Favorite"),
            ],
          ),
          onPressed: null,
        )
      ],
    );
  }
}
