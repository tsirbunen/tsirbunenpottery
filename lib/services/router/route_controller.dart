import 'package:go_router/go_router.dart';
import 'package:madmudmobile/services/router/routes.dart';

class RouteController {
  RouteController();

  GoRouter buildRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: HomeRoute.path,
          builder: (context, state) => HomeRoute().build(context, state),
        ),
        GoRoute(
          path: CollectionsRoute.path,
          builder: (context, state) => CollectionsRoute().build(context, state),
        ),
        GoRoute(
          path: PiecesRoute.path,
          builder: (context, state) => PiecesRoute().build(context, state),
        ),
      ],
    );
  }
}
