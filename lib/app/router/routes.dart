import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madmudmobile/features/story/presentation/story_page.dart';
import 'package:madmudmobile/features/collections/presentation/collections_page.dart';
import 'package:madmudmobile/features/contact/presentation/contact_page.dart';
import 'package:madmudmobile/features/pieces/presentation/pieces_page.dart';
import 'package:madmudmobile/features/home/presentation/home_page.dart';

// Note: We want to use type-safe routes, and for that, go_router supports using routes
// generated with the go_router_builder package (that uses build_runner under the hood).
// Using "part" to import code is generally discouraged by the Dart team, but widely used
// in the Flutter community in cases of code generation and here we also resort to that
// to import the generated code parts.
part 'routes.g.dart';

const collectionsRoot = '/collections';
const piecesRoot = '/pieces';
const contactRoot = '/contact';
const storyRoot = '/story';

@TypedGoRoute<HomeRoute>(path: HomeRoute.path, routes: [
  TypedGoRoute<HomeRoute>(path: HomeRoute.path),
]) // NOTE: No space here, otherwise the go router builder code generation won't work!
@immutable
class HomeRoute extends GoRouteData {
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@immutable
class CollectionsRoute extends GoRouteData {
  static const path = collectionsRoot;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CollectionsPage();
}

@immutable
class PiecesRoute extends GoRouteData {
  static const path = piecesRoot;

  @override
  Widget build(BuildContext context, GoRouterState state) => const PiecesPage();
}

@immutable
class ContactRoute extends GoRouteData {
  static const path = contactRoot;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ContactPage();
}

@immutable
class StoryRoute extends GoRouteData {
  static const path = storyRoot;

  @override
  Widget build(BuildContext context, GoRouterState state) => const StoryPage();
}
