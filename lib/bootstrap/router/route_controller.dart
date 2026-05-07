import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/router/routes.dart';
import 'package:tsirbunenpottery/features/not_found/presentation/pages/not_found_page.dart';

GoRouter buildRouter() {
  return GoRouter(
    routes: $appRoutes,
    errorBuilder: (context, state) =>
        NotFoundPage(path: state.uri.toString()),
  );
}
