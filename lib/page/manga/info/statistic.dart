import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({
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
              "Statistik",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Divider(height: 8),
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    topRight: Radius.circular(3),
                  ),
                ),
                child: StatisticItem(
                  icon: Icon(Icons.star, color: Colors.white),
                  backgroundIconColor: Colors.orange,
                  label: "Rating",
                  data: comic["rating"].toString(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    right: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                child: StatisticItem(
                  icon: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                  ),
                  backgroundIconColor: Colors.green,
                  label: "User Rating",
                  data: comic["userRating"] ?? "0",
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                  ),
                ),
                child: StatisticItem(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                  backgroundIconColor: Colors.lightBlue,
                  label: "Hits",
                  data: comic["hits"] ?? "0",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StatisticItem extends StatelessWidget {
  final String label;
  final data;
  final Icon icon;
  final Color backgroundIconColor;

  const StatisticItem({
    Key key,
    this.label,
    this.data,
    this.icon,
    this.backgroundIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: backgroundIconColor,
              borderRadius: BorderRadius.circular(3),
            ),
            child: icon,
          ),
        ),
        Expanded(flex: 3, child: Text(label)),
        Expanded(
          flex: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(data.toString()),
          ),
        ),
      ],
    );
  }
}
