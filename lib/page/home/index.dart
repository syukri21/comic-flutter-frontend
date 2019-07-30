import 'package:comic/global/appbar/index.dart';
import 'package:comic/global/bottom-navigation/index.dart';
import 'package:comic/page/home/banner.dart';
import 'package:comic/page/home/bloc/bloc.dart';
import 'package:comic/page/home/navigation.dart';
import 'package:comic/page/home/new-comics.dart';
import 'package:comic/page/home/popular-comics.dart';
import 'package:comic/util/normalization-directionality.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final bottomNavbarBloc = BottomnavbarBloc();
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomnavbarBloc>(
      builder: (context) => BottomnavbarBloc(),
      child: BlocListener<BottomnavbarBloc, BottomnavbarState>(
        listener: (BuildContext context, state) {},
        child: BlocBuilder<BottomnavbarBloc, BottomnavbarState>(
          builder: (context, state) {
            int position = 1;

            if (state is BottomnavbarChanged) {
              position = state.position;
            }

            return HomePageBloc(
              title: title,
              navBarPosition: position,
            );
          },
        ),
      ),
    );
  }
}

class HomePageBloc extends StatefulWidget {
  final int navBarPosition;
  final String title;

  HomePageBloc({Key key, @required this.title, this.navBarPosition: 1})
      : super(key: key);

  @override
  _HomePageBlocState createState() => _HomePageBlocState();
}

class _HomePageBlocState extends State<HomePageBloc> {
  TextDirection lastDirection = TextDirection.ltr;

  IconData get showIcon {
    IconData currentIcon;

    switch (widget.navBarPosition) {
      case 0:
        currentIcon = Icons.pages;
        break;
      case 1:
        currentIcon = Icons.add;
        break;
      default:
        currentIcon = Icons.people;
    }

    return currentIcon;
  }

  TextDirection get textDirection {
    TextDirection direction;
    if (widget.navBarPosition == 0) {
      direction = TextDirection.rtl;
    } else if (widget.navBarPosition == 1) {
      direction = lastDirection;
    } else {
      direction = TextDirection.ltr;
    }
    lastDirection = direction;
    return direction;
  }

  FloatingActionButtonLocation get positionDocked {
    if (widget.navBarPosition == 1)
      return FloatingActionButtonLocation.centerDocked;
    return FloatingActionButtonLocation.endDocked;
  }

  get isRtl {
    return textDirection == TextDirection.rtl;
  }

  @override
  Widget build(BuildContext context) {
    print(lastDirection);
    return Directionality(
      child: Scaffold(
        appBar: AppBarComic.getAppBar(widget.title, context, isRtl),
        body: _home(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: null,
          child: Icon(showIcon),
          mini: true,
        ),
        bottomNavigationBar: BottomNavigation(
          navBarPosition: widget.navBarPosition,
        ),
        floatingActionButtonLocation: positionDocked,
      ),
      textDirection: textDirection,
    );
  }
}

class _home extends StatelessWidget {
  const _home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalizationDirectionality(
      child: Container(
        child: ListView(
          children: <Widget>[
            BannerCarouselQuery(),
            Navigation(),
            NewComics(),
            PopularComics(),
          ],
        ),
      ),
    );
  }
}
