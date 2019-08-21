import 'package:comic/page/manga/action.dart';
import 'package:comic/page/manga/detail.dart';
import 'package:comic/page/manga/info.dart';
import 'package:comic/page/manga/queryComic.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'appbar.dart';

class Manga extends StatelessWidget {
  final String mangaId;

  const Manga({Key key, this.mangaId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MangaQuery(id: mangaId);
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}

class MangaQuery extends StatelessWidget {
  final String id;

  const MangaQuery({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: queryComic,
        variables: {
          "where": {"id": id},
          "params": {"OrderBy": "number_DESC", "First": 5}
        },
        fetchPolicy: FetchPolicy.cacheFirst,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("");

        var comic = result.data["comic"];
        return new MangaBuilder(comic: comic, genres: comic["genres"]);
      },
    );
  }
}

class MangaBuilder extends StatelessWidget {
  const MangaBuilder({
    Key key,
    @required this.comic,
    this.genres,
  }) : super(key: key);

  final comic;
  final genres;

  @override
  Widget build(BuildContext context) {
    print(genres.length);
    return Scaffold(
      body: NestedScrollView(
        body: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            MangaDetail(comic: comic),
            MangaAction(comicId: comic["id"]),
            CustomDivider(),
            MangaInfo(comic: comic, genres: genres)
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return mangaAppbar(innerBoxIsScrolled, comic);
        },
      ),
    );
  }
}



class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
