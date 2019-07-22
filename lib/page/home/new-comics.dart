import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comic/util/position.dart';

const comics = [
  {
    "id": "cjy9287480gju0743a4m9mbb3",
    "title": "Meng Shi Zai Shang Bahasa Indonesia",
    "image":
        "https://i3.wp.com/kiryuu.co/wp-content/uploads/2019/02/Meng-Shi-Zai-Shang.jpg"
  },
  {
    "id": "cjy9287oa0gkw0743vloceqkb",
    "title": "I’m a Fake NPC Bahasa Indonesia",
    "image":
        "https://i3.wp.com/kiryuu.co/wp-content/uploads/2018/12/Im-a-Fake-NPC.jpg"
  },
  {
    "id": "cjyalbk4u00170720sqf0lfwt",
    "title": "Overlord Bahasa Indonesia",
    "image":
        "https://i1.wp.com/kiryuu.co/wp-content/uploads/2018/09/Overlord.png"
  },
  {
    "id": "cjyalbl9h00380720w9emp1th",
    "title": "I Am The Sorcerer King Bahasa Indonesia",
    "image":
        "https://i2.wp.com/kiryuu.co/wp-content/uploads/2019/06/I-Am-The-Sorcerer-King.jpg"
  }
];

class NewComics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Title(),
          ListComics(),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 5, left: 18, right: 18),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("List"),
            GestureDetector(
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class ListComics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: comics
            .asMap()
            .map((i, item) => MapEntry(
                i,
                Comic(
                  item: item,
                  index: i,
                  length: comics.length,
                )))
            .values
            .toList(),
      ),
    );
  }
}

class Comic extends StatelessWidget {
  final item;
  final index;
  final length;
  Margin margin;

  Comic({Key key, this.item, this.index, this.length}) : super(key: key) {
    this.margin = Margin(index: this.index, length: this.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: this.margin.left, right: this.margin.right),
      child: Image(
        image: NetworkImage(this.item["image"]),
      ),
    );
  }
}
