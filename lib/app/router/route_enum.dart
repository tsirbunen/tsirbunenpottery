import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/app/router/routes.dart';

enum RouteEnum {
  home,
  categories,
  collections,
  designs,
  story,
  contact,
}

// Note: Let's use switch-case to return the path for each route,
// so that if we miss a route, the code editor gives us a warning.
extension PathExtension on RouteEnum {
  String path() {
    switch (this) {
      case RouteEnum.home:
        return HomeRoute.path;
      case RouteEnum.categories:
        return CategoriesRoute.path;
      case RouteEnum.collections:
        return CollectionsRoute.path;
      case RouteEnum.designs:
        return DesignsRoute.path;
      case RouteEnum.contact:
        return ContactRoute.path;
      case RouteEnum.story:
        return StoryRoute.path;
      default:
        throw Exception('Route path not implemented!');
    }
  }
}

extension PageNameExtension on RouteEnum {
  Translation pageName() {
    switch (this) {
      case RouteEnum.home:
        return Translation.home;
      case RouteEnum.categories:
        return Translation.categories;
      case RouteEnum.collections:
        return Translation.collections;
      case RouteEnum.designs:
        return Translation.designs;
      case RouteEnum.contact:
        return Translation.contact;
      case RouteEnum.story:
        return Translation.story;
      default:
        throw Exception('Page name not implemented!');
    }
  }
}
