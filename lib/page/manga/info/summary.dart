import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({
    Key key,
    @required this.comic,
  }) : super(key: key);

  final comic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    );
  }
}
