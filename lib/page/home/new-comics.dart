import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comic/util/margin.dart';

import 'package:comic/util/dummy.dart' as dummy;

import 'package:comic/graphql/query/comics.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class NewComics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Query(
        options: QueryOptions(
          document: readComics, // this is the query string you just created
          variables: {'last': 3, 'orderBy': "rating_DESC"},
        ),
        builder: (QueryResult result, {VoidCallback refetch}) {
          if (result.errors != null) {
            return Text(result.errors.toString());
          }

          if (result.loading) {
            return Text('Loading');
          }

          // it can be either Map or List
          // List repositories = result.data['viewer']['repositories']['nodes'];

          List datas = result.data["comics"];
          print(datas.length);

          return Column(
            children: <Widget>[
              Title(),
              ListComics(),
            ],
          );
        },
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
            Text("List"),
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
      options: QueryOptions(
        document: readComics,
        variables: {
          'first': 10,
          'orderBy': 'rating_DESC',
        },
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) {
          return Text(result.errors.toString());
        }

        if (result.loading) {
          return Text('Loading');
        }

        List comics = result.data["comics"];

        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: ListView.builder(
            itemCount: comics.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Comic(
                item: comics[index],
                length: comics.length,
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}

class Comic extends StatelessWidget {
  final item;
  final index;
  final length;
  Margin margin;

  Comic({Key key, this.item, this.index, this.length}) : super(key: key) {
    this.margin = Margin(index: this.index, length: this.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: this.margin.left,
        right: this.margin.right,
        top: 5,
        bottom: 20,
      ),
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 4),
            color: Color.fromRGBO(0, 0, 0, 0.3),
            spreadRadius: 2,
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(this.item["image"]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
