import 'package:flutter/material.dart';

class MangaDetail extends StatelessWidget {
  const MangaDetail({
    Key key,
    @required this.comic,
  }) : super(key: key);

  final comic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            comic["title"].replaceAll("Bahasa Indonesia", "").trim(),
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Farro"),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              comic["author"],
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Farro",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            comic["status"],
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Farro",
              color: Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
