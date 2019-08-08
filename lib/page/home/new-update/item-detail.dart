import 'package:comic/helper/date.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    Key key,
    @required this.comics,
    this.index,
  }) : super(key: key);

  final List comics;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        comics[index]["title"]
                            .replaceAll("Bahasa Indonesia", "")
                            .trim(),
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.secondaryVariant,
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: PopupMenuButton(
                      elevation: 10,
                      padding: const EdgeInsets.all(0),
                      // onSelected: result) { setState(() { _selection = result; }); },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        const PopupMenuItem(
                          value: 0,
                          child: Text('Read Now'),
                        ),
                        const PopupMenuItem(
                          value: 1,
                          child: Text('Favorite'),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text('Download'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    GetDate().relativeRange(comics[index]["updateOn"]),
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
