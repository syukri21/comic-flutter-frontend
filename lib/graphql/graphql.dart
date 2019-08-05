import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQL {
  static final HttpLink httpLink = HttpLink(
    uri: 'http://202.83.122.72:4000/query',
  );

  static NormalizedInMemoryCache cache = NormalizedInMemoryCache(
    dataIdFromObject: typenameDataIdFromObject,
  );
  // static final AuthLink authLink = AuthLink(
  //   getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  //   // OR
  //   // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  // );

  // static final Link link = authLink.concat(httpLink as Link);

  static String typenameDataIdFromObject(Object object) {
    if (object is Map<String, Object> &&
        object.containsKey('__typename') &&
        object.containsKey('id')) {
      return "${object['__typename']}/${object['id']}";
    }
    return null;
  }

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: cache,
      link: httpLink as Link,
    ),
  );
}
