import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic/graphql/query/comics.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

List<int> test = [1, 2, 3, 4, 6];

class AllBody extends StatelessWidget {
  const AllBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AllBodyQuery(),
    );
  }
}

class AllBodyQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("Loading...");
        List comics = result.data["comics"];
        return AllBodyBuilder(comics: comics);
      },
      options: QueryOptions(
        document: readComics,
        fetchPolicy: FetchPolicy.cacheFirst,
        variables: {"first": 20, "orderBy": "title_ASC"},
      ),
    );
  }
}

class AllBodyBuilder extends StatelessWidget {
  const AllBodyBuilder({
    Key key,
    @required this.comics,
  }) : super(key: key);

  final List comics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      itemCount: comics.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: comics[index]["image"],
                imageBuilder: (BuildContext context, porvider) {
                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    child: Image(
                      image: porvider,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  comics[index]["title"].replaceAll("Bahasa Indonesia", ""),
                  style: TextStyle(
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      },
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.50,
      ),
    );
  }
}
