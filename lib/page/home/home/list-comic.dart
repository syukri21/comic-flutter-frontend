import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic/util/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comic extends StatelessWidget {
  final item;
  final index;
  final length;

  String get chapterName {
    if (this.item["chapters"] != null && this.item["chapters"][0] != null) {
      return this.item["chapters"][0]["name"];
    }
    return '';
  }

  String get title {
    return this.item["title"].replaceAll("Bahasa Indonesia", "");
  }

  Margin get margin {
    return Margin(index: this.index, length: this.length);
  }

  Comic({Key key, this.item, this.index, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      useOldImageOnUrlChange: true,
      imageBuilder: (context, provider) => Card(
        margin: EdgeInsets.only(
          left: this.margin.left,
          right: this.margin.right,
          bottom: 3,
        ),
        elevation: 1.5,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            image: DecorationImage(image: provider, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ChapterName(name: this.chapterName),
              ComicTitle(title: this.title)
            ],
          ),
        ),
      ),
      fit: BoxFit.cover,
      imageUrl: this.item["image"],
    );
  }
}

class ChapterName extends StatelessWidget {
  final name;

  const ChapterName({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.name == '') return SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Text(
        this.name,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}

class ComicTitle extends StatelessWidget {
  final title;

  const ComicTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Text(
        this.title,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
