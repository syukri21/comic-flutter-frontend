import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:comic/page/manga/readQuery.dart';

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
        document: readComic,
        variables: {
          "where": {"id": id},
          "params": {"OrderBy": "number_DESC", "First": 5}
        },
        fetchPolicy: FetchPolicy.cacheFirst,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("Loading..");

        var comic = result.data["comic"];
        return Scaffold(
          body: NestedScrollView(
            body: ListView(
              padding: const EdgeInsets.all(0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        comic["title"]
                            .replaceAll("Bahasa Indonesia", "")
                            .trim(),
                        style: TextStyle(fontSize: 20, fontFamily: "Farro"),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          """Oleh ${comic["author"]} -- ${comic["status"]}""",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Farro",
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  forceElevated: innerBoxIsScrolled,
                  floating: true,
                  title: Text("Bangsat"),
                ),
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: false,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Stack(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: FlexibleSpaceBar(
                              background: CachedNetworkImage(
                                imageUrl: comic["image"],
                                imageBuilder:
                                    (BuildContext context, provider) =>
                                        Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: provider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Theme.of(context).primaryColor,
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Color(0xffFAFAFA),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 70),
                            width: 150,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: comic["image"],
                              fit: BoxFit.cover,
                              width: 150,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ];
            },
          ),
        );
      },
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          color: Colors.yellow,
        ),
      );

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
