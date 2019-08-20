import 'package:comic/page/manga/action.dart';
import 'package:comic/page/manga/detail.dart';
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

  EdgeInsets margin(index) {
    if (index == 0) {
      return EdgeInsets.only(left: 16);
    }

    if (index == genres.length - 1) {
      return EdgeInsets.only(right: 16, left: 8);
    }

    return EdgeInsets.only(left: 8);
  }

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
            Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Ringkasan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Divider(height: 8),
                      Text(
                        comic["synopsis"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: this.margin(index),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              genres[index]["genre"],
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: genres.length,
                  ),
                )
              ],
            )
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
