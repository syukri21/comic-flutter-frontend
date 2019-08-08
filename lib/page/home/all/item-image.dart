import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

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
          child: Image(
            image: porvider,
            height: 180,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
