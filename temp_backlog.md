# Codebase Audit — Fresh Review (2026-04-21)

Severity scale: CRITICAL > HIGH > MEDIUM > LOW

---

## CRITICAL


**C4** `localization/utils.dart:21-22`
Category: Bug / Localization
`.substring(0, 2)` to extract language codes assumes codes are always 2 characters. Locale codes like `zh-Hans` or `en-US` will be silently truncated incorrectly. Use `locale.languageCode` instead.

**C5** `features/pieces/presentation/single_piece_view/design_description.dart:16`
Category: Null Safety / Crash
`design.names[language]!` force-unwraps a nullable map lookup. If a design is missing a translation for the active language (data inconsistency or new language added), this crashes at runtime. Use `?? ''` fallback or a safe lookup helper.

**C6** `data/firestore_cloud_service.dart:46`
Category: Null Safety / Crash
`.map((doc) => doc.data())` in collection fetch does not guard against documents with null data. Force-unwrapping or directly using the result will crash on any malformed document. Add `.where((d) => d.data() != null)` before mapping.

**C7** `data/products_repository.dart:224`
Category: Null Safety / Crash
`value as String` performs a hard cast without a prior type check. If Firestore returns a non-string value in this field, the app throws a `TypeError`. Use `value is String ? value : null` or `value?.toString()`.

---

## HIGH

**H1** `data/products_repository.dart` (overall)
Category: Architecture / SRP
God repository: parses 4 entity types, resolves cross-references, and holds a cache — all in one class. Violates SRP. Extract `PiecesDataParser`, `DesignsDataParser`, etc. or a dedicated `FirestoreDataParser` service.

**H2** `data/products_repository.dart:204-226`
Category: Performance
`_idsOfRefs()` and `_idOfRef()` call `items.any()` (O(n)) for every reference lookup. With large datasets this is O(n²). Pre-build a `Set<String>` of valid IDs once before the loop.

**H3** `data/products_repository.dart:70-154`
Category: Error Handling / Observability
`whereType<T>()` silently drops malformed Firestore items. In production, data silently disappears with no alerting. Log at warning level with doc ID and field name; consider reporting rejection rate to analytics.

**H4** `data/firestore_cloud_service.dart:28`
Category: Null Safety
`doc.data()!` force-unwraps after an existence check. Firestore can return a document snapshot with `null` data even when `exists == true`. Replace with `doc.data() ?? {}`.

**H5** All BLoC state files
Category: BLoC / State Design
Every state's `copyWith()` only allows updating `blocStatus`. Data payload fields (`homePageImageFileName`, `piecesById`, `designsById`, etc.) cannot be updated through `copyWith`, forcing full state reconstruction elsewhere. Extend every `copyWith` to include all fields.

**H6** `widgets/progress_indicator/progress_indicator_xl.dart:37-50`
Category: Bug / Lifecycle
`context` and `Theme.of(context)` are accessed inside `Future.delayed(Duration.zero, ...)`. If the widget unmounts before the future resolves, this throws a `FlutterError`. Add `if (!mounted) return;` before any `context` or `setState` call in the callback.

**H7** `features/home/presentation/pages/home_page.dart:21-24`
Category: Performance / Widget
`BlocBuilder<LanguageBloc>` wraps `BlocBuilder<HomeBloc>`. Every language change rebuilds the entire home widget tree including the image. Use `buildWhen` to scope each builder to the fields it actually depends on.

**H8** (Global)
Category: Error Handling
No retry backoff anywhere. When a Firestore fetch fails and the user taps Retry, the identical request fires immediately. Under a transient outage this hammers Firestore with no benefit. Add exponential backoff with a cap (e.g. 1s → 2s → 4s → max 30s).

**H9** (Global)
Category: Architecture / Testability
No abstract interfaces for repositories. Concrete classes are registered directly in GetIt, making them unswappable in unit tests without real Firebase. Add `abstract interface class IProductsRepository` etc. and register implementations against the interfaces.

**H10** (Global)
Category: Security / Error Handling
All errors use `e.toString()` as the message stored in `BlocStatus` and potentially shown in UI. This leaks internal exception text (file paths, library internals, stack fragments) to end users. Define a custom exception hierarchy and map to safe, user-facing strings.

**H11** `widgets/photo_with_fallback/photo_with_fallback.dart`
Category: Resource Management
Image listener management in `didUpdateWidget` is fragile. Rapid URL changes can leave previous listeners attached, causing multiple onLoad callbacks per image. Always call `_removeImageListener()` before adding a new one, unconditionally.

**H12** `main.dart:8-14`
Category: Error Handling / Startup
Firebase initialization has no error handling and no timeout. If Firebase is unreachable, the app hangs on a blank screen indefinitely. Wrap in `try/catch` with a user-visible error state, and add a `Future.any([init, timeout])` guard.

**H13** `data/products_repository.dart:156-161`
Category: Performance
`_toLanguage()` does a linear scan through the `Language` enum values for every single field parsed from every single document. This is called thousands of times per fetch. Replace with a `Map<String, Language>` lookup table initialized once.

**H14** `widgets/items_grid/models.dart:44`
Category: Bug / Layout
Integer division `~/` in `computeGridParams` can yield 0 columns if the available width is smaller than the minimum photo width (e.g. narrow screen or test harness). A 0-column `GridView` will throw a layout assertion. Clamp the result to a minimum of 1.

**H15** All BLoC files — catch blocks
Category: Observability
`catch (e)` in every fetch handler drops the `StackTrace`. Without it, production errors are near-impossible to diagnose. Change all catch clauses to `catch (e, s)` and pass `s` to the logger.

---

## MEDIUM

**M1** `core/state/app_bloc_event.dart`
Category: Architecture
`AppBlocEvent` is a plain abstract class. `BlocStatusChanged` is its only shared child, yet all specific feature events also extend it, creating a confusing flat hierarchy. Convert to a `sealed class` so pattern-matching is exhaustive and self-documenting.

**M2** `core/types/bloc_status/bloc_status.dart:12`
Category: Error Handling
`message` is optional even on error states. An `BlocStatus(Status.error)` with no message is useless for debugging. Add `final Object? originalError; final StackTrace? stackTrace;` and make `message` required when status is error.

**M3** `data/products_repository.dart:31`
Category: Caching / Data Freshness
`_cache` has no TTL or invalidation path. If the owner updates Firestore while the app is open, the UI shows stale data permanently. Add a cache expiry timestamp or a manual refresh event.

**M4** `features/collections/presentation/collections_view/collections_view.dart` vs `categories_view.dart`
Category: Code Duplication
Both views are structurally identical — same fetch pattern, BlocBuilder nesting, `_designsToShow()` logic, and expand/map pipeline. Extract a parameterised `GroupedItemsView<T>` widget to eliminate the duplication.

**M5** `features/contact/presentation/contact_view/contact_form.dart:140-163`
Category: Code Quality
Four nearly identical text-style getter methods differing only in font size. Consolidate into `_labelStyle(double size)`.

**M6** `localization/app_locale.dart:16`
Category: Null Safety
`Localizations.of<AppLocale>(context, AppLocale)!` force-unwraps. In any widget outside the localization scope (e.g. unit test, dialog) this crashes. Return a sensible default or `throw` a descriptive error.

**M7** `widgets/items_grid/items_grid.dart:64`
Category: Performance
`_designsById` map is reconstructed on every `build()` call from the full designs list. Cache it in `didUpdateWidget`, rebuilding only when the `designs` reference actually changes.

**M8** `widgets/items_grid/items_grid.dart:81-82`
Category: Testing / Known Bug
FIXME comment acknowledges that the widget fails in tests due to horizontal overflow. Fix the test setup (wrap in `SizedBox` with explicit constraints) or convert to a tracked issue. Leaving an acknowledged broken test in production code is not acceptable.

**M9** `widgets/horizontal_navigation/horizontal_navigation.dart:72-79`
Category: Performance
`TextPainter` is instantiated fresh for every navigation label on every `build()`. Cache computed widths in a `late final` map initialized once in `initState`.

**M10** `widgets/app_bar/app_bar_customized.dart:8-10`
Category: Magic Numbers
`appBarHeight = 81.0` and layout breakpoints have no explanatory note. Document how these values are derived or reference a shared `AppDimensions` constants class.

**M11** `features/contact/presentation/contact_view/photo_and_info.dart:9` and `features/pieces/presentation/single_piece_view/piece_photos.dart:7`
Category: Duplication / Constants
`Size(275, 275)` and `Size(300, 300)` are hardcoded inline across multiple files. Move all shared photo sizes to a central `AppSizes` or `AppDimensions` file.

**M12** `utils/constants.dart`
Category: Organisation
Single file mixes Firestore document IDs with UI layout constants. Split into `firestore_constants.dart` and a theme-adjacent sizes file so each has a single, findable responsibility.

**M13** `theme/colors.dart:3`
Category: Dead Code
Commented-out color with a Finnish comment. Remove dead code; if the design decision matters, summarise it in English in ARCHITECTURE.md.

**M14** `theme/app_theme.dart:32`
Category: Dead Code
`// fontSize: 12,` commented out with no context. Remove or explain why it's preserved.

**M15** `bootstrap/service_locator/service_locator.dart`
Category: Architecture
All repositories are directly instantiated inline without a factory abstraction. As the feature count grows this file will become a god file. Extract a `DependencyModule` per feature layer.

**M16** All BLoC files
Category: Observability
`_onFetch()` silently drops events when `isLoading == true`. During development this masks unexpected double-dispatches. Add a debug-level log: `_logger.debug('FetchXxx dropped — already loading')`.

**M17** `features/pieces/presentation/single_piece_view/single_piece_view.dart:34-40`
Category: UX / Error Handling
If a piece ID is missing from the cache (stale link, bad navigation), the user sees generic text with no recovery action. Add a "back to all pieces" button or auto-pop after a short delay.

**M18** `localization/validate_translations.dart:4`
Category: Architecture / FIXME
FIXME comment: translation completeness is validated at test runtime, not compile time. Use `build_runner` to generate a lookup that fails compilation when a key is missing.

**M19** `widgets/progress_indicator/progress_indicator_xl.dart:37-50`
Category: Anti-pattern
`Future.delayed(Duration.zero)` to defer `Theme.of(context)` is a workaround for an init-order problem. Move color resolution into `didChangeDependencies()`, which is the correct lifecycle hook for inheriting theme/context data.

**M20** `data/products_repository.dart:140`
Category: Type Safety
Manual `as List<dynamic>` casting against expected Firestore schema. Consider using `json_serializable` (already in the project) for Firestore model deserialization to validate document shape at the data boundary.

**M21** `core/state/language_bloc/language_state.dart`
Category: Naming
`copyWith(Language? newLanguage)` — the parameter is named `newLanguage` but the field is `language`. Inconsistent naming between parameter and field. Use the same name as the field.

**M22** `bootstrap/service_locator/service_locator.dart:34`
Category: Observability
Logs are fully silenced in release mode. This makes production debugging extremely hard. Use log levels instead: keep `warning` and `error` enabled in release; only suppress `debug` and `verbose`.

**M23** `bootstrap/service_locator/service_locator.dart:37`
Category: Code Quality
`cloudService ??= FirestoreCloudService()` modifies a parameter in-place inside the function body. This is a confusing mutation pattern. Assign to a local variable: `final service = cloudService ?? FirestoreCloudService()`.

**M24** `widgets/footer/footer.dart:37-40`
Category: Null Safety / Performance
`Theme.of(context).textTheme.bodySmall!` force-unwraps inside a `.map()` call. Additionally, `Theme.of(context)` is called once per item in the map instead of once at the top of `build()`. Cache the theme and handle the nullable `bodySmall` safely.

**M25** `widgets/horizontal_navigation/horizontal_navigation.dart:22,35`
Category: Performance
`MediaQuery.of(context)` called at least twice in the same `build()`. Cache it at the top: `final mq = MediaQuery.of(context)`.

**M26** `features/home/presentation/pages/home_page.dart:73-81`
Category: Code Quality
`_subTitleStyle()` and `_mainDescriptionStyle()` are near-identical getters that differ only in font size and weight. Merge into a single `_textStyle({required double size, FontWeight weight = FontWeight.normal})` helper.

**M27** `widgets/items_grid/scroll_position_mixin.dart:8`
Category: Lifecycle
`late final ScrollController _scrollController` is initialised in `didChangeDependencies()`. If `didChangeDependencies` fires before `initState` in any edge case, or is skipped in tests, the late field access will throw. Initialize in `initState` instead.

**M28** `widgets/photo_with_fallback/photo_with_fallback.dart:127`
Category: State Management
`AppEnvironment.noNetworkImages` is a mutable static global mutated directly in the widget. Mutable statics cannot be reset between tests, making widget tests non-deterministic. Inject this as a parameter or via DI.

**M29** `bootstrap/router/routes.dart:31,81,106`
Category: Const Correctness
`NoTransitionPage(child: SomePage(...))` is not `const` at any of these call sites. If page constructors are const, wrap in `const NoTransitionPage(child: const SomePage())` to avoid unnecessary re-allocations on navigation.

**M30** `features/contact/presentation/contact_view/contact_form.dart:8`
Category: Hardcoded Color
`Color.fromARGB(255, 235, 234, 232)` defined inline. This is a design token that belongs in `colors.dart` or `app_theme.dart` — not embedded in a feature widget.

**M31** `features/contact/presentation/contact_view/contact_form.dart:47,65,66`
Category: Magic Numbers
`150.0` width, `50.0` height, various spacing values hardcoded inline. Move to `AppDimensions` or the form's own `_ContactFormDimensions` private class.

**M32** `widgets/company/trademark.dart`
Category: Constants
`'assets/birdie512.png'` is a hardcoded inline string. Asset paths should be constants in a dedicated `AppAssets` class so they can be refactored without hunting across files.

**M33** `features/pieces/presentation/single_piece_view/piece_photos.dart:26-27`
Category: Lifecycle
`_controller` is created in `initState` but `dispose()` doesn't null-check before calling `.dispose()` on it. If an exception prevents `initState` from completing, `dispose()` will throw. Assign `null` initially and use `?. dispose()`.

**M34** All BLoC files — boilerplate
Category: Architecture / DRY
Every feature BLoC repeats the same `_onFetch` skeleton: guard against loading, emit loading state, call repository, emit success/error. This is 30+ lines duplicated six times. Extract a `BaseFetchBloc<TEvent, TState, TData>` mixin or abstract class.

**M35** All BLoC state files
Category: Architecture
All feature states implement `Equatable` manually with an identical `props` list pattern. Because models use `freezed`, states should too — use `@freezed` to get `==`, `copyWith`, and `toString` for free and eliminate the manual boilerplate.

**M36** `widgets/items_grid/models.dart:3-10`
Category: Magic Numbers
Seven breakpoint and sizing constants (`defaultMinPhotoWidth`, `defaultMaxPhotoWidth`, `kNarrowColumnsCount`, etc.) live in a widget-layer models file. These are layout configuration values and belong in a `AppLayoutConstants` file in `theme/` or `utils/`.

**M37** `features/contact/presentation/contact_view/contact_email_with_copy_option.dart:8-9`
Category: Magic Numbers
`12.0` font size and `Duration(seconds: 2)` for the copy confirmation timeout are hardcoded. Move to named constants.

**M38** `core/types/bloc_status/bloc_status.dart`
Category: Dead Code
`Status.dirty` and `Status.submitting` are defined but never set anywhere in the codebase. Either add usage (e.g. optimistic updates) or remove them to reduce cognitive overhead.

**M39** `widgets/photo_with_fallback/photo_with_fallback.dart:7`
Category: Magic Numbers
`Duration(milliseconds: 1500)` for fade animation is hardcoded inline. Extract to a named constant or make it a configurable widget parameter with a default.

**M40** `widgets/photo_with_fallback/no_image_icon_placeholder.dart:61`
Category: Magic Numbers
`Duration(milliseconds: 1250)` for placeholder animation hardcoded. Should be a named constant.

**M41** `widgets/company/company.dart:7-10`
Category: Magic Numbers / Theme
`fontSize: 15.0` and `fontSize: 12.0` hardcoded inline instead of using `Theme.of(context).textTheme`. Every font size should come from the theme system.

**M42** `features/home/presentation/pages/home_page.dart:13`
Category: Magic Numbers
`photoSize = Size(275.0, 275.0)` hardcoded inline. This is the third occurrence of similar sizes across different files (see also M11). Centralise all photo dimensions.

**M43** `bootstrap/router/route_controller.dart`
Category: Architecture
`RouteController` is a class containing a single method with no fields. This is not a class — it is a function. Replace with a top-level function `GoRouter buildRouter()`.

**M44** `features/designs/presentation/designs_view/designs_view.dart:23`
Category: Naming
`scrollTargetName` is defined as a getter but its value is constructed from a string literal — it reads like a computed property but is actually a static-ish constant. Rename to a `static const` or extract to `ScrollTarget` enum.

---

## LOW

**L1** All feature BLoC files
Category: Dead Code
`_onBlocStatusChanged` handler is registered in every BLoC. In most it simply re-emits the current state (a no-op). Document why this exists or remove it.

**L2** All BLoC state files
Category: Dead Code
`Status.dirty` is defined but never set anywhere. Remove or document its intended semantics.

**L3** `bootstrap/router/routes.dart`
Category: Comment
Comment apologetically notes that `part` files are discouraged. If code gen is the accepted trade-off, just leave a one-line note about why — remove the hand-wringing.

**L4** Various widget files
Category: Const Correctness
Multiple const-eligible widgets are missing the `const` keyword. Run `flutter analyze` and address all `prefer_const_constructors` and `prefer_const_literals_to_create_immutables` lints.

**L5** All feature BLoC files
Category: Naming
`_onFetch` is the private handler name in every BLoC. When a breakpoint or log message fires, it's hard to tell which BLoC you're in. Rename to `_onFetchPieces`, `_onFetchDesigns`, etc.

**L6** `features/categories/presentation/categories_view/categories_view.dart:68-102`
Category: Readability
Multi-level `expand()` + `where()` pipeline inlined in `build()` is hard to follow. Extract `_buildWidgetsForCategory(Category c)` to separate logic from layout.

**L7** (Global)
Category: Testing
No unit tests for any repository or BLoC. Production-grade apps require near-100% unit test coverage on business logic. Add `bloc_test` tests for all BLoCs and `mockito`/`mocktail` fakes for repositories.

**L8** (Global)
Category: Observability
No crash reporting integration (Sentry, Firebase Crashlytics). Errors are logged locally but never reported to an external service. Add Crashlytics before public launch.

**L9** `core/logging/dev_app_logger.dart:9,14,23`
Category: Code Quality / DRY
`tag = 'App'` default parameter is copy-pasted across three separate method signatures. Extract as `static const String _defaultTag = 'App'` and reference it.

**L10** `widgets/photo_with_fallback/no_image_icon_placeholder.dart:57`
Category: Code Quality
`if (widget.isAnimated == false)` should be `if (!widget.isAnimated)`. Comparing a bool to a literal is a code smell.

**L11** `features/pieces/presentation/single_piece_view/photo_carousel_indicator.dart:3,22`
Category: Magic Numbers
`10.0` dot size and `3.0` spacing hardcoded. Extract as `const _dotSize = 10.0` etc. within the file or in `AppDimensions`.

**L12** `widgets/items_grid/scroll_position_mixin.dart:10`
Category: Dead Code
`_initialized` flag is set to `true` once and never read. Remove it; the `ScrollController` being non-null serves the same purpose.

**L13** `features/contact/presentation/contact_view/contact_email_with_copy_option.dart:34`
Category: Error Handling
`catch (_) {}` swallows clipboard errors silently. At minimum log at debug level so developers know when clipboard access fails (common on some browsers).

**L14** `theme/app_theme.dart`
Category: Organisation
`themeData` getter is 50+ lines. Extract sub-sections (`_textTheme()`, `_colorScheme()`, `_inputDecorationTheme()`) for readability and easier future maintenance.

**L15** `widgets/app_bar/app_bar_customized.dart:6-8`
Category: FIXME / Technical Debt
FIXME comment: "as long as the app is only web...". This is untracked technical debt. Convert to a GitHub issue or remove if not planned.

**L16** `widgets/drawer/drawer_for_app_bar.dart:9`
Category: Magic Numbers
`60.0` container width hardcoded. Move to `AppDimensions`.

**L17** `core/scroll_position_cache/scroll_position_cache.dart`
Category: Documentation
`_positions[target] ?? 0.0` returns `0.0` as a default scroll offset. This implicit default is non-obvious — add a brief comment explaining it's intentional (start at top when no position is cached).

**L18** `widgets/company/trademark.dart`
Category: Organisation
Nine separate magic-number constants at the top of a small widget file. Either move them to `AppDimensions`/`AppAssets` or group them into a private inner class `_Sizes` / `_Assets` inside the file.

**L19** (Global)
Category: Non-English Comments
Finnish comments appear in `colors.dart` and possibly elsewhere. The engineering standard for a production codebase is English-only comments. Translate or remove.

**L20** `features/pieces/presentation/pages/pieces_page.dart`
Category: Layering
The page widget is a thin pass-through that adds no behaviour — it just returns the view. With the current architecture this is correct, but if the page truly has no logic of its own it should at minimum be a `const` constructor with a `const` child.

**L21** All feature state files
Category: Naming
State classes inherit from `Equatable` and manually list `props`. With freezed (already used for domain models) this boilerplate is unnecessary. Migrate states to `@freezed` for consistency with the rest of the model layer.

**L22** `widgets/bloc_status_view/bloc_status_view.dart:36`
Category: Magic Numbers
`16.0` spacing is hardcoded. Use `AppDimensions` or a theme spacing scale.

**L23** `widgets/app_bar/app_bar_right_actions.dart:29-30`
Category: Readability
Inline ternary for language-toggle label. Extract as `_languageLabel(Language lang)` for clarity.

**L24** `widgets/drawer/drawer_route_item.dart:5-10`
Category: Organisation
Six layout constants defined locally in a small widget file. Move to `AppDimensions` or a shared `DrawerConstants` class.
