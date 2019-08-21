import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> mangaAppbar(bool innerBoxIsScrolled, comic) {
  return <Widget>[
    SliverAppBar(
      pinned: true,
      forceElevated: innerBoxIsScrolled,
      floating: true,
      title: Text("Bangsat"),
    ),
    SliverAppBar(
      expandedHeight: 300,
      pinned: false,
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                    imageUrl: comic["image"],
                    imageBuilder: (BuildContext context, provider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: provider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Theme.of(context).primaryColor,
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xffFAFAFA),
                ),
              ),
            ],
          ),
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 70),
                width: 150,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CachedNetworkImage(
                  imageUrl: comic["image"],
                  fit: BoxFit.cover,
                  width: 150,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  ];
}
