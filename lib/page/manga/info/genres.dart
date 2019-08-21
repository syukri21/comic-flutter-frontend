import 'package:flutter/material.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key key,
    @required this.genres,
  }) : super(key: key);

  final genres;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: genres
              .asMap()
              .map<int, Widget>(
                (i, item) => MapEntry<int, Widget>(
                  i,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(item["genre"]),
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
