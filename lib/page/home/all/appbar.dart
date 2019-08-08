import 'package:comic/global/count-manga/index.dart';
import 'package:comic/global/popup-menu-item-text/index.dart';
import 'package:comic/graphql/query/count-comics.dart';
import 'package:comic/page/home/all/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CountMangaQuery(),
          SortByMenu(),
        ],
      ),
    );
  }
}

class SortByMenu extends StatelessWidget {
  const SortByMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllblocBloc, AllblocState>(
      listener: (BuildContext context, AllblocState state) {},
      child: BlocBuilder<AllblocBloc, AllblocState>(
        builder: (BuildContext context, AllblocState state) {
          int defaultState = 0;

          if (state is ChangedSortAllBy) {
            defaultState = state.value;
          }
          return new AllPopupMenuButton(
            defaultState: defaultState,
          );
        },
      ),
    );
  }
}

class AllPopupMenuButton extends StatelessWidget {
  const AllPopupMenuButton({
    Key key,
    @required this.defaultState,
    this.allblocBloc,
  }) : super(key: key);

  final int defaultState;
  final AllblocBloc allblocBloc;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 10,
      child: Container(
        width: 50,
        alignment: Alignment.centerRight,
        child: Icon(Icons.filter_list),
      ),
      padding: const EdgeInsets.all(0),
      onSelected: (value) => _handleSortMenuBy(context: context, value: value),
      offset: Offset(0, 0),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          enabled: false,
          value: -1,
          child: Text(
            'Sort By',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 0,
          child: PopupMenuItemText(
            title: "Name",
            isActive: defaultState == 0,
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: PopupMenuItemText(
            title: "Rating",
            isActive: defaultState == 1,
          ),
        ),
      ],
    );
  }

  void _handleSortMenuBy({int value, BuildContext context}) {
    final allblocBloc = BlocProvider.of<AllblocBloc>(context);
    allblocBloc.dispatch(SortAllBy(value));
  }
}

class CountMangaQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: readCountsComic,
        variables: {"where": null},
        fetchPolicy: FetchPolicy.cacheFirst,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("");
        int count = result.data["countComics"];
        return CountManga(count: count.toString());
      },
    );
  }
}
