import 'package:madmudmobile/services/router/routes.dart';

enum RouteEnum {
  home,
  pieces,
  collections,
  // IMPLEMENT SOON:
  // contact,
  // gallery,
  // account,
  // faq,
}

// IMPLEMENT LATER:
// shopping-related stuff

// Note: Let's use switch-case to return the path for each route,
// so that if we miss a route, the code editor gives us a warning.
extension PathExtension on RouteEnum {
  String path() {
    switch (this) {
      case RouteEnum.home:
        return HomeRoute.path;
      case RouteEnum.pieces:
        return PiecesRoute.path;
      case RouteEnum.collections:
        return CollectionsRoute.path;
      default:
        throw Exception('Route path not implemented!');
    }
  }
}
