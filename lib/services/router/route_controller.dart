import 'package:go_router/go_router.dart';
import 'package:madmudmobile/features/collections/presentation/collections_page.dart';
import 'package:madmudmobile/features/home/presentation/home_page.dart';
import 'package:madmudmobile/features/pieces/presentation/pieces_page.dart';
import 'package:madmudmobile/services/router/routes.dart';

// NOTE: Use NoTransitionPage to avoid the disturbing slide in effect
// that does not look good in desktop mobile

class RouteController {
  RouteController();

  GoRouter buildRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: HomeRoute.path,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: CollectionsRoute.path,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CollectionsPage(),
          ),
        ),
        GoRoute(
          path: PiecesRoute.path,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PiecesPage(),
          ),
        ),
      ],
    );
  }
}
