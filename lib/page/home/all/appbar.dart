import 'package:comic/graphql/query/count-comics.dart';
import 'package:comic/page/home/all/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
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
    return BlocBuilder<AllblocBloc, AllblocState>(
      builder: (BuildContext context, AllblocState state) {
        int defaultState = 0;

        if (state is ChangedSortAllBy) {
          defaultState = state.value;
        }
        return PopupMenuButton(
          elevation: 10,
          child: Container(
            width: 50,
            alignment: Alignment.centerRight,
            child: Icon(Icons.filter_list),
          ),
          padding: const EdgeInsets.all(0),
          initialValue: defaultState,
          onSelected: (value) =>
              _handleSortMenuBy(value: value, context: context),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              enabled: false,
              value: -1,
              child: Text(
                'Sort By:',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            PopupMenuDivider(),
            const PopupMenuItem(
              value: 0,
              child: Text('Name'),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text('Rating'),
            ),
          ],
        );
      },
    );
  }

  void _handleSortMenuBy({int value, BuildContext context}) {
    final allblocBloc = BlocProvider.of<AllblocBloc>(context);
    allblocBloc.dispatch(SortAllBy(value));
  }
}

class CountManga extends StatelessWidget {
  final String count;
  const CountManga({
    Key key,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      """$count manga""",
      style: TextStyle(
        fontFamily: "Farro",
        fontSize: 14,
        color: Theme.of(context).colorScheme.secondaryVariant,
      ),
    );
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
