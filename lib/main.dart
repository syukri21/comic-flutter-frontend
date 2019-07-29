import 'package:comic/graphql/graphql.dart';
import 'package:comic/page/home/index.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(ComicApp());
}

class ComicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQL.client,
      child: CacheProvider(
        child: MaterialApp(
          title: "Comic",
          initialRoute: "/",
          routes: {"/": (context) => HomePage(title: "Manga Ree")},
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              elevation: 0,
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
          ),
        ),
      ),
    );
  }
}
