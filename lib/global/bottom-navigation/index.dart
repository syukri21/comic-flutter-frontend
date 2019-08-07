import 'package:flutter/material.dart';

class ComicBottomNavigationBar extends StatelessWidget {
  final handleChangeCurrentIndex;
  final int _currentIndex;

  const ComicBottomNavigationBar({
    Key key,
    @required int currentIndex,
    this.handleChangeCurrentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  Widget build(BuildContext context) {
    return Theme(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: handleChangeCurrentIndex,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text(
              "Bookmark",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text(
              "History",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download),
            title: Text(
              "Download",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 11, fontFamily: "Farro"),
            ),
          )
        ],
      ),
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
