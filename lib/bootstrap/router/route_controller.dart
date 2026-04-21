import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/router/routes.dart';

GoRouter buildRouter() {
  return GoRouter(routes: $appRoutes);
}
