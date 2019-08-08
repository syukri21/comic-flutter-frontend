import 'package:flutter/material.dart';

class PopupMenuItemText extends StatelessWidget {
  const PopupMenuItemText({Key key, this.isActive, this.title})
      : super(key: key);

  final bool isActive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.secondaryVariant),
    );
  }
}
