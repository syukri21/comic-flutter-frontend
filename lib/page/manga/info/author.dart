import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  const Author({
    Key key,
    @required this.comic,
  }) : super(key: key);

  final comic;

  List<String> get authors {
    String author = comic["author"];
    List<String> authors = author.split("),");
    int index = 0;

    for (var author in authors) {
      if (index == authors.length - 1) {
        authors[index] = author;
      } else {
        authors[index] = author + ")";
      }
      index++;
    }
    return authors;
  }

  List<String> author(String authorFull) {
    String job = "(Stroy & Art)";
    String name = authorFull;
    authorFull.replaceAllMapped(RegExp(r'\(.*\)'), (i) {
      job = i.group(0);
      return i.group(0);
    });
    name = authorFull.replaceAll(job, "");
    return [name, job];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Penulis",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Divider(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 20,
              children: authors.map<Widget>((name) {
                return AuthorItem(
                  name: author(name)[0],
                  job: author(name)[1],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorItem extends StatelessWidget {
  const AuthorItem({Key key, this.name, this.job}) : super(key: key);

  final String name;
  final String job;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Icon(
            Icons.person,
            size: 30,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Text(name.trim(), maxLines: 1, overflow: TextOverflow.ellipsis),
        Text(job.trim(),
            style: TextStyle(
                fontSize: 12,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.4)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis)
      ],
    );
  }
}
