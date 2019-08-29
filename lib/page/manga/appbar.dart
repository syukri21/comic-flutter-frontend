import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> mangaAppbar(bool innerBoxIsScrolled, comic) {
  const double expandedHeight = 300;

  return <Widget>[
    SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      automaticallyImplyLeading: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return MangaAppbarFlexible(
            comic: comic,
            height: constraints.biggest.height,
          );
        },
      ),
    ),
  ];
}

class MangaAppbarFlexible extends StatelessWidget {
  final comic;
  final double height;

  MangaAppbarFlexible({
    Key key,
    this.comic,
    this.height,
  }) : super(key: key);

  int get bottomBackgroundFlex {
    int height = (this.height.toInt() - 200) ~/ 4;
    if (height > 0) return height;
    return 0;
  }

  double get opacity {
    int flex = bottomBackgroundFlex - 2;
    if (flex > 31) {
      flex = 31;
    } else if (flex < 1) {
      flex = 0;
    }

    return flex / 31;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 60,
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
              flex: bottomBackgroundFlex,
              child: Container(
                color: Color(0xffFAFAFA),
              ),
            ),
          ],
        ),
        Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: opacity,
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: comic["image"],
                  fit: BoxFit.cover,
                  width: 150,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
