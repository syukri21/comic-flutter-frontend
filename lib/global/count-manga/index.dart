import 'package:flutter/material.dart';

class CountManga extends StatelessWidget {
  final String count;
  const CountManga({
    Key key,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      """$count manga""",
      style: TextStyle(
        fontFamily: "Farro",
        fontSize: 14,
        color: Theme.of(context).colorScheme.secondaryVariant,
      ),
    );
  }
}
