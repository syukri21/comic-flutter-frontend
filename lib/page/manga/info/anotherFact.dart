import 'package:comic/helper/date.dart';
import 'package:flutter/material.dart';

class AnotherFact extends StatelessWidget {
  const AnotherFact({
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
              "Fakta",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Divider(height: 8),
          Column(
            children: <Widget>[
              AnotherFactItem(
                  label: "Japanese Title", data: comic["japaneseTitle"]),
              AnotherFactItem(label: "Type", data: comic["type"]),
              AnotherFactItem(label: "Released", data: comic["released"]),
              AnotherFactItem(label: "Posted By", data: comic["postedBy"]),
              AnotherFactItem(
                label: "Update On",
                data: GetDate().relativeRange(comic["updateOn"]),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AnotherFactItem extends StatelessWidget {
  const AnotherFactItem({
    Key key,
    this.label,
    this.data,
  }) : super(key: key);

  final String label;
  final String data;

  String get showData {
    if (data == "" || data == null) {
      return "Unknown";
    }
    return this.data;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Align(alignment: Alignment.topLeft, child: Text(label))),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              showData.trim(),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
