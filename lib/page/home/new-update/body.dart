import 'package:comic/helper/date.dart';
import 'package:comic/page/home/new-update/item-detail.dart';
import 'package:comic/page/home/new-update/item-image.dart';
import 'package:comic/page/home/new-update/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyBlocReceiver();
  }
}

class BodyBlocReceiver extends StatelessWidget {
  const BodyBlocReceiver({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewUpdateBloc, NewUpdateState>(
      listener: (BuildContext context, NewUpdateState state) {},
      child: BlocBuilder<NewUpdateBloc, NewUpdateState>(
        builder: (BuildContext context, NewUpdateState state) {
          int defaultSortValue = 0;
          if (state is ChangedNewUpdateSortBy) {
            defaultSortValue = state.value;
          }
          return BodyQuery(sortValue: defaultSortValue);
        },
      ),
    );
  }
}

class BodyQuery extends StatelessWidget {
  static const String readComics = """
  query readComics(\$first: Int, \$orderBy: ComicOrderByInput, \$where: ComicWhereInput) {
    comics(first: \$first, orderBy: \$orderBy, where: \$where) {
      id
      title
      image
      rating
      updateOn
    }
  }
""";

  const BodyQuery({Key key, @required this.sortValue}) : super(key: key);

  final int sortValue;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: readComics,
        fetchPolicy: FetchPolicy.cacheFirst,
        variables: {
          "first": 21,
          "orderBy": orderBy[sortValue],
          "where": {"updateOn_gt": GetDate().lastDays(1)}
        },
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.errors != null) return Text(result.errors.toString());
        if (result.loading) return Text("Loading...");
        List comics = result.data["comics"];
        return BodyBuilder(comics: comics);
      },
    );
  }

  List<String> get orderBy {
    return ["title_ASC", "rating_DESC", "updateOn_DESC"];
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
              Expanded(flex: 3, child: ItemImage(comics: comics, index: index)),
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
