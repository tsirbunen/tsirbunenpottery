// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $HomeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/collections',
          factory: $CollectionsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/categories',
          factory: $CategoriesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/designs/:id',
          factory: $DesignRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/contact',
          factory: $ContactRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/story',
          factory: $StoryRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CollectionsRouteExtension on CollectionsRoute {
  static CollectionsRoute _fromState(GoRouterState state) => CollectionsRoute();

  String get location => GoRouteData.$location(
        '/collections',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CategoriesRouteExtension on CategoriesRoute {
  static CategoriesRoute _fromState(GoRouterState state) => CategoriesRoute();

  String get location => GoRouteData.$location(
        '/categories',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DesignRouteExtension on DesignRoute {
  static DesignRoute _fromState(GoRouterState state) => DesignRoute(
        id: state.pathParameters['id']!,
        fromRoute: _$boolConverter(state.uri.queryParameters['from-route']!),
      );

  String get location => GoRouteData.$location(
        '/designs/${Uri.encodeComponent(id)}',
        queryParams: {
          'from-route': fromRoute.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ContactRouteExtension on ContactRoute {
  static ContactRoute _fromState(GoRouterState state) => ContactRoute();

  String get location => GoRouteData.$location(
        '/contact',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StoryRouteExtension on StoryRoute {
  static StoryRoute _fromState(GoRouterState state) => StoryRoute();

  String get location => GoRouteData.$location(
        '/story',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}
