import 'package:go_router/go_router.dart';
import 'package:madmudmobile/features/story/presentation/story_page.dart';
import 'package:madmudmobile/features/collections/presentation/collections_page.dart';
import 'package:madmudmobile/features/contact/presentation/contact_page.dart';
import 'package:madmudmobile/features/home/presentation/home_page.dart';
import 'package:madmudmobile/features/pieces/presentation/pieces_page.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/app/router/route_enum.dart';
import 'package:madmudmobile/app/router/routes.dart';

// NOTE: Use NoTransitionPage to avoid the disturbing slide in effect
// that does not look good in desktop mobile

class RouteController {
  RouteController();

  GoRouter buildRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: HomeRoute.path,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.home.pageName()),
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: CollectionsRoute.path,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.collections.pageName()),
            child: const CollectionsPage(),
          ),
        ),
        GoRoute(
          path: PiecesRoute.path,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.pieces.pageName()),
            child: const PiecesPage(),
          ),
        ),
        GoRoute(
          path: ContactRoute.path,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.contact.pageName()),
            child: const ContactPage(),
          ),
        ),
        GoRoute(
          path: StoryRoute.path,
          pageBuilder: (context, state) => NoTransitionPage(
            name: context.local(RouteEnum.story.pageName()),
            child: const StoryPage(),
          ),
        ),
      ],
    );
  }
}
