import 'package:comic/graphql/query/comics.dart';
import 'package:comic/page/home/all/bloc/allbloc_bloc.dart';
import 'package:comic/page/home/all/bloc/allbloc_state.dart';
import 'package:comic/page/home/all/item-image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'item-detail.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener<AllblocBloc, AllblocState>(
        child: BlocBuilder<AllblocBloc, AllblocState>(
          builder: (BuildContext context, AllblocState state) {
            int defaultState = 0;
            if (state is ChangedSortAllBy) {
              defaultState = state.value;
            }
            return BodyQuery(sortValue: defaultState);
          },
        ),
        listener: (BuildContext context, AllblocState state) {},
      ),
    );
  }
}

class BodyQuery extends StatelessWidget {
  final int sortValue;

  const BodyQuery({Key key, this.sortValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("Loading...");
        List comics = result.data["comics"];
        return BodyBuilder(comics: comics);
      },
      options: QueryOptions(
        document: readComics,
        fetchPolicy: FetchPolicy.cacheFirst,
        variables: {
          "first": 21,
          "orderBy": sortValue == 0 ? "title_ASC" : "rating_DESC"
        },
      ),
    );
  }
}

class BodyBuilder extends StatelessWidget {
  const BodyBuilder({
    Key key,
    @required this.comics,
  }) : super(key: key);

  final List comics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      physics: NeverScrollableScrollPhysics(),
      itemCount: comics.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(flex: 4, child: ItemImage(comics: comics, index: index)),
              ItemDetail(comics: comics, index: index),
            ],
          ),
        );
      },
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.498,
      ),
    );
  }
}
