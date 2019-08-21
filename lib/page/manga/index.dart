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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8,
                      runSpacing: 8,
                      children: genres
                          .asMap()
                          .map<int, Widget>(
                            (i, item) => MapEntry<int, Widget>(
                              i,
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Text(item["genre"]),
                              ),
                            ),
                          )
                          .values
                          .toList(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Statistik",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Divider(height: 8),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(3),
                              ),
                            ),
                            child: StatisticItem(
                              icon: Icon(Icons.star, color: Colors.white),
                              backgroundIconColor: Colors.orange,
                              label: "Rating",
                              data: comic["rating"].toString(),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                right: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            child: StatisticItem(
                              icon: Icon(
                                Icons.supervised_user_circle,
                                color: Colors.white,
                              ),
                              backgroundIconColor: Colors.green,
                              label: "User Rating",
                              data: comic["userRating"] ?? "0",
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                              ),
                            ),
                            child: StatisticItem(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              backgroundIconColor: Colors.lightBlue,
                              label: "Hits",
                              data: comic["hits"] ?? "0",
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
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

class StatisticItem extends StatelessWidget {
  final String label;
  final data;
  final Icon icon;
  final Color backgroundIconColor;

  const StatisticItem({
    Key key,
    this.label,
    this.data,
    this.icon,
    this.backgroundIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: backgroundIconColor,
              borderRadius: BorderRadius.circular(3),
            ),
            child: icon,
          ),
        ),
        Expanded(flex: 3, child: Text(label)),
        Expanded(
          flex: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(data.toString()),
          ),
        ),
      ],
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
