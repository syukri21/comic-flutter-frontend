import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key key,
    @required this.comics,
    this.index,
  }) : super(key: key);

  final List comics;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: comics[index]["image"],
      imageBuilder: (BuildContext context, porvider) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: porvider,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryVariant
                          .withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          comics[index]["rating"] == 0
                              ? "?"
                              : comics[index]["rating"].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 14,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
