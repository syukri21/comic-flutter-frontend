import 'package:comic/page/home/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ComicApp());
}

class ComicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Comic",
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              elevation: 0, color: Color.fromRGBO(245, 245, 245, 1)),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xffF5F5F5),
        ),
        home: HomePage(title: "Manga Ree"));
  }
}
