import 'package:comic/graphql/query/genres.dart';
import 'package:comic/page/home/style/navigation.dart' as style;
import 'package:comic/util/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'loading/navigation.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      height: 55.0,
      child: NavigationQuery(),
    );
  }
}

class NavigationQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: readGenres),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text("errors");
        if (result.loading) return LoadingNavigation();

        List genres = result.data["genres"];

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return NavigationItem(
              menu: genres[index]["genre"],
              index: index,
              length: genres.length,
            );
          },
          itemCount: genres.length,
        );
      },
    );
  }
}

class NavigationItem extends StatelessWidget {
  final menu;
  final index;
  final length;

  Margin get margin {
    return Margin(index: this.index, length: this.length);
  }

  NavigationItem({Key key, @required this.menu, this.index, this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[style.boxShadow],
      ),
      child: Container(
        child: Text(menu, style: TextStyle(color: Colors.white)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: style.linearGradienRed,
        ),
      ),
      margin: EdgeInsets.only(
        bottom: 15,
        left: this.margin.left,
        right: this.margin.right,
      ),
    );
  }
}
