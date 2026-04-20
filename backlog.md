





FINDING #16 — SEVERITY: MEDIUM
items_grid.dart:81 — Unresolved FIXME in production code ("fails in tests due to horizontal overflow"). This is a test debt that should be tracked.


FINDING #18 — SEVERITY: MEDIUM
bloc_status_view.dart:3,28 — Shared widget directly calls getIt<AppLogger>(). A widget reaching into the service locator is a hidden dependency that breaks widget testability. Error logging should happen in the bloc, not the view layer.

FINDING #19 — SEVERITY: MEDIUM
piece_card.dart:55-58 — When imageFileNames is empty, creates a Photo with id: '' and url: '$photoBaseUrl' (empty filename appended). Returns non-nullable Photo where it should return null so PhotoWithFallback can show the placeholder properly.

FINDING #20 — SEVERITY: MEDIUM
photo_with_fallback.dart:127-132 — setState() called inside initState(). This causes a double-build. Fields should be set directly without setState in initState.

FINDING #21 — SEVERITY: MEDIUM
single_piece_view.dart:56-58 — No BlocStatusView wrapper. When data is loading, piece == null shows "design not found" text instead of a loading indicator. UX bug.


FINDING #23 — SEVERITY: LOW
route_controller.dart — RouteController is a stateless class wrapping a single buildRouter() call. Unneeded abstraction; should be a top-level function.

FINDING #24 — SEVERITY: MEDIUM
app_environment.dart:2 — Mutable static global noNetworkImages = false. Mutable global state is untestable and not resettable between tests. Should use dependency injection.

FINDING #25 — SEVERITY: MEDIUM
contact_page.dart:13,23 — ContactPage has a constructor parameter imageFileName that is never used (actual value comes from HomeBloc on line 23). Dead parameter.

FINDING #26 — SEVERITY: MEDIUM
contact_page.dart:19 — ContactPage reads from HomeBloc directly — cross-feature coupling. Contact shouldn't know about Home state. The image should be passed in or come from a shared photo repository.

FINDING #27 — SEVERITY: LOW
contact_email_with_copy_option.dart:24 — Clipboard.setData(...) result is not awaited. Clipboard write failures are silently ignored.

FINDING #28 — SEVERITY: LOW
title_with_hover_effect.dart:29,32 — State class TitleWithHoverEffectState is public. State classes should be private (_TitleWithHoverEffectState).

FINDING #29 — SEVERITY: MEDIUM
prepare_blocs_for_tests.dart:30 — getIt.isRegistered<LanguageBloc>() guard masks global test state pollution. If multiple test groups use this, earlier test state leaks into later groups. Tests should each own their setup/teardown lifecycle cleanly.

FINDING #30 — SEVERITY: MEDIUM
drawer_for_app_bar.dart:26 — Shows RouteEnum.values in the drawer including designs, which has no active route. Tapping it would 404.

FINDING #31 — SEVERITY: LOW
drawer_for_app_bar.dart:28,30 — context.local(route.pageName()) called twice — line 28 computes pageName, but line 30 recomputes it instead of using the variable.

FINDING #32 — SEVERITY: MEDIUM
routes.dart:110-118 — DesignsRoute is a fully active route definition. But ARCHITECTURE.md says designs is "commented-out (not active)". The codebase and documentation are out of sync — the route IS live.

FINDING #33 — SEVERITY: LOW
routes.dart:23 — storyRoot = '/story' constant is dead code — never used anywhere.

FINDING #34 — SEVERITY: HIGH (DRY)
designs_view.dart:87-112 — Third divergent implementation of the _gridParams algorithm, alongside pieces_view.dart:81-106 and models.dart:40-69. Three separate versions of the same layout computation with subtly different implementations.

FINDING #35 — SEVERITY: LOW
app_locale.dart:52 — shouldReload() returns true unconditionally, triggering unnecessary reloads on every check. For a const delegate, false is correct.

FINDING #36 — SEVERITY: MEDIUM
app_locale.dart:11 — late Translations translations is a mutable late field set once in the constructor. Should be final.

ARCHITECTURAL FINDING A — SEVERITY: HIGH
PiecesState, CategoriesState, CollectionsState, DesignsState all independently store designsById and piecesById. Every feature bloc holds its own copy of the full product dataset. As data grows, memory multiplies linearly with features. A central "products store" would serve all feature blocs from one source.

ARCHITECTURAL FINDING B — SEVERITY: HIGH
Errors stored as e.toString() in bloc state (BlocStatus.message). Raw exception text can reach users. Production apps must: (1) never expose raw exception messages to users, (2) map errors to domain-level messages, (3) preserve StackTrace for logging.

FINDING #37 — SEVERITY: MEDIUM
horizontal_navigation.dart:22 — GoRouter.of(context).routerDelegate.currentConfiguration.uri.path accesses internal router state. Should use GoRouterState.of(context).uri.path (the public API).

FINDING #38 — SEVERITY: MEDIUM
Both horizontal_navigation.dart:43 and drawer_for_app_bar.dart:26 iterate RouteEnum.values — this shows designs in the nav bar and drawer, causing navigation to an active route that the architecture docs say is commented out. This is the routing inconsistency from Finding #22 compounded in the UI.

FINDING #39 — SEVERITY: MEDIUM
collections_repository.dart:36 — O(n) List.contains check to avoid duplicates. Should use a Set for piece IDs.

FINDING #40 — SEVERITY: HIGH (bug)
categories_repository.dart:34-35 vs collections_repository.dart:36-38 — Collections guards against duplicate piece IDs; categories doesn't. If a piece could appear twice in a category grouping, categories would have duplicate piece IDs silently.

FINDING #41 — SEVERITY: MEDIUM
Piece.fromJson, Design.fromJson, Category.fromJson, Collection.fromJson — all declared via json_serializable but never called from application or test code. ProductsRepository manually constructs models from maps. The entire json_serializable code-gen stack is unused dead weight — or the models should actually use these factories instead of manual parsing.

FINDING #42 — SEVERITY: MEDIUM (architectural)
Models use json_serializable + freezed but Firestore documents contain DocumentReference objects that json_serializable can't handle. So fromJson is fundamentally unusable for Firestore data. Either drop json_serializable or implement custom converters. Currently it's generating dead code.

FINDING #43 — SEVERITY: MEDIUM
pubspec.yaml:11 — bloc_test and mockito are in dependencies (production), not dev_dependencies. These are test-only libraries and bloat the web bundle.

FINDING #44 — SEVERITY: MEDIUM
pubspec.yaml:12 — build_verify is also in dependencies instead of dev_dependencies.

FINDING #45 — SEVERITY: HIGH (observability gap)
pieces_bloc.dart:35-37, categories_bloc.dart:37-39, etc. — Feature blocs catch errors but no logger is injected. Errors are stored in state as e.toString() without being logged with stack traces. Production errors are invisible in monitoring.

---

# Summary Tables

Full codebase audit — 2026-04-18.

## HIGH severity

| # | Location | Issue |
|---|---|---|
| 13 | `categories_view.dart:81` `collections_view.dart:81` | O(n²) piece lookup: `allPieces.where((p) => pieceIds.contains(p.id))` where `pieceIds` is a `List`. Convert to `Set`. |
| 15 | `categories_view.dart` `collections_view.dart` | Near-identical files — same double-`BlocBuilder` structure, same `_fetchTriggered` pattern, same `_designsToShow` logic, same O(n²) lookup. Should share a base class or mixin. |
| 34 | `pieces_view.dart:81` `designs_view.dart:87` `models.dart:40` | Three separate and subtly different implementations of the same grid-params layout algorithm. One canonical function needed. |
| 40 | `categories_repository.dart` vs `collections_repository.dart` | Collections guards against duplicate piece IDs; categories does not. If a piece appears in a category more than once, the ID list is silently corrupted. |
| 45 | All feature blocs | No logger injected into feature blocs. Errors are caught and stored in state but never logged — production errors are invisible. |
| A | All feature states | `PiecesState`, `CategoriesState`, `CollectionsState`, `DesignsState` each store their own full copy of `designsById` and `piecesById`. Memory grows linearly with the number of features. A single shared products store should serve all blocs. |
| B | All feature bloc catch blocks | `e.toString()` is stored in `BlocStatus.message` and can reach the UI. Raw exception text must never be shown to users. Errors should map to user-friendly messages, and `StackTrace` should be passed to the logger. |

## MEDIUM severity

| # | Location | Issue |
|---|---|---|

| 9 | All feature views | `_fetchTriggered` boolean flag in `didChangeDependencies` is a fragile one-time fetch pattern. Blocs should be seeded consistently in `service_locator.dart`, as `HomeBloc` already is. |
| 10 | All feature views | `BlocBuilder<LanguageBloc>` wraps the feature `BlocBuilder`. Any language change rebuilds the entire feature widget tree. |
| 14 | `categories_view.dart:52` `collections_view.dart:52` | `categoriesById` map, `allPieces.toList()`, and grouped designs are all recomputed on every `build()`. Should be derived once when state changes. |
| 16 | `items_grid.dart:81` | Unresolved FIXME in production code about horizontal overflow in tests. |
| 17 | `pieces_view.dart:81` | `_gridParams()` is a near-duplicate of `computeGridParams()` in `models.dart` but takes `List<int>` instead of a `Map`. The two implementations have diverged. |
| 18 | `bloc_status_view.dart:28` `photo_with_fallback.dart:216` | Widgets call `getIt<AppLogger>()` directly — a hidden service-locator dependency that breaks widget testability. Error logging belongs in the bloc. |
| 19 | `piece_card.dart:55` | Returns a non-nullable `Photo` with an empty URL when `imageFileNames` is empty. Should return `null` so `PhotoWithFallback` shows the placeholder. |
| 20 | `photo_with_fallback.dart:127` | `setState()` called inside `initState()` causes a double build. Fields should be set directly without `setState`. |
| 21 | `single_piece_view.dart:56` | No `BlocStatusView` wrapper. While data is loading, `piece == null` shows "design not found" instead of a loading indicator. UX bug. |
| 22, 32, 38 | `route_enum.dart` `routes.dart` `ARCHITECTURE.md` | The designs route is fully active in the code (`DesignsRoute` registered, bloc wired up, shown in nav/drawer), but `ARCHITECTURE.md` says it is "commented-out (not active)". Docs and code are out of sync. |
| 24 | `app_environment.dart:2` | `noNetworkImages` is a mutable static global — untestable and not resettable between test groups. Should use dependency injection. |
| 25 | `contact_page.dart:13` | Constructor parameter `imageFileName` is declared but never used — the actual value is read from `HomeBloc` instead. |
| 26 | `contact_page.dart:19` | `ContactPage` reads from `HomeBloc` directly. Cross-feature coupling — Contact should not know about Home state. |
| 29 | `prepare_blocs_for_tests.dart:30` | `getIt.isRegistered` guard masks test state pollution. State from one test group can silently leak into the next. |
| 30 | `drawer_for_app_bar.dart:26` `horizontal_navigation.dart:43` | Both iterate `RouteEnum.values`, which includes `designs`. This renders a nav item that leads to a broken or ambiguous route. |
| 36 | `app_locale.dart:11` | `late Translations translations` is mutable but set exactly once in the constructor. Should be `final`. |
| 37 | `horizontal_navigation.dart:22` | Reads current path via the internal API `routerDelegate.currentConfiguration.uri.path`. Should use the public `GoRouterState.of(context).uri.path`. |
| 39 | `collections_repository.dart:36` | Uses `List.contains` to check for duplicate piece IDs — O(n) per piece. Should use a `Set`. |
| 41 | All domain models | `fromJson`/`toJson` are declared via `json_serializable` but never called from application or test code. `ProductsRepository` manually constructs models from raw maps. |
| 42 | All domain models | `json_serializable` cannot handle Firestore `DocumentReference` objects, so `fromJson` is fundamentally unusable for Firestore data. Either drop `json_serializable` or add custom converters. |
| 43 | `pubspec.yaml` | `bloc_test`, `mockito`, and `build_verify` are in `dependencies` instead of `dev_dependencies`. These are test-only libraries that bloat the production web bundle. |

## LOW severity

| # | Location | Issue |
|---|---|---|
| 12 | `home_page.dart:76,81` | `textTheme.bodyMedium!` is null-asserted. Should use `?? const TextStyle()` as a fallback. |
| 23 | `route_controller.dart` | `RouteController` is a stateless class wrapping a single method call. Should be a top-level function. |
| 27 | `contact_email_with_copy_option.dart:24` | `Clipboard.setData()` is not awaited — write failures are silently ignored. |
| 28 | `title_with_hover_effect.dart:29,32` | State class `TitleWithHoverEffectState` is public. Should be `_TitleWithHoverEffectState`. |
| 31 | `drawer_for_app_bar.dart:28,30` | `context.local(route.pageName())` is called twice on consecutive lines. The already-computed `pageName` variable should be reused. |
| 33 | `routes.dart:23` | `storyRoot = '/story'` is a dead constant — never used anywhere. |
| 35 | `app_locale.dart:52` | `shouldReload()` returns `true` unconditionally. For a `const` delegate, `false` is correct. |
