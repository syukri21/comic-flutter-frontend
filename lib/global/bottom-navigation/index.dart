import 'package:comic/util/normalization-directionality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
    @required this.navBarPosition,
  }) : super(key: key);

  final int navBarPosition;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: Theme.of(context).primaryColor,
      child: NormalizationDirectionality(
        child: Padding(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _listIcon(context),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }

  List<Widget> _listIcon(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(
            navBarPosition != 0 ? Icons.pages : null,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () => {}),
      IconButton(
          icon: Icon(
            navBarPosition != 1 ? Icons.add : null,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () => {}),
      IconButton(
          icon: Icon(
            navBarPosition != 2 ? Icons.people : null,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () => {}),
    ];
  }
}
