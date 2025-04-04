import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/services/router/routes.dart';

enum RouteEnum {
  home,
  pieces,
  collections,
}

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

extension PageNameExtension on RouteEnum {
  String pageName() {
    switch (this) {
      case RouteEnum.home:
        return Translation.home.toKey();
      case RouteEnum.pieces:
        return Translation.pieces.toKey();
      case RouteEnum.collections:
        return Translation.collections.toKey();
      default:
        throw Exception('Page name not implemented!');
    }
  }
}
