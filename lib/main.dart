import 'package:comic/graphql/graphql.dart';
import 'package:comic/page/home/all/bloc/allbloc_bloc.dart';
import 'package:comic/page/home/new-update/bloc/bloc.dart';
import 'package:comic/page/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: BlocProvider<AllblocBloc>(
          builder: (BuildContext context) => AllblocBloc(),
          child: BlocProvider<NewUpdateBloc>(
            builder: (BuildContext context) => NewUpdateBloc(),
            child: MaterialApp(
              title: "Comic",
              initialRoute: "/",
              routes: {
                "/": (context) => Pages(),
              },
              theme: _theme(),
            ),
          ),
        ),
      ),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      primaryColor: Color(0xff7289da),
      buttonColor: Color(0xff7BBB5E),
      colorScheme: ColorScheme(
        primary: Color(0xff7289da),
        secondary: Color(0xff99AAB5),
        secondaryVariant: Color(0xff2c2f33),
        background: Color(0xffffffff),
        brightness: Brightness.light,
        primaryVariant: Color(0xff7F94DE),
        error: Color(0xffCB2431),
        onBackground: Color(0xff2C2F33),
        onError: Color(0xffffffff),
        onPrimary: Color(0xffffffff),
        onSecondary: Color(0xffffffff),
        onSurface: Color(0xff2C2F33),
        surface: Color(0xffffffff),
      ),
    );
  }
}
