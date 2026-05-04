# Senior Engineering Audit — Full Codebase
_Generated 2026-04-28. Treat every item as a candidate for discussion, not as a definitive bug list._



## 2. ARCHITECTURE / BIG PICTURE




### 2-G. Cached `Future` in `ProductsRepository` is poisoned on error
File: `lib/data/products_repository.dart:36`
`_cache ??= _fetchAllFromCloud()` stores the Future itself. If `_fetchAllFromCloud()` throws, the Future is stored as a failed Future. All subsequent calls return the same failed Future immediately — the cache is poisoned and retries are impossible without re-instantiating `ProductsRepository`. Fix: in `_fetchAllFromCloud`, on catch, reset `_cache = null` before rethrowing (or catch at the assignment site and null the cache on failure).

### 2-H. `HomeRepository` and `ContactRepository` each make a separate Firestore call to `miscellaneous`
Files: `lib/features/home/repository/home_repository.dart`, `lib/features/contact/repository/contact_repository.dart`
Both fetch a single document from the same `miscellaneous` collection (different doc IDs). These could be batched into a single `fetchMany` call or merged into one `MiscRepository`. At startup, two unnecessary round-trips fire simultaneously.

### 2-I. Feature repositories are not registered in GetIt — manual threading required as app grows
File: `lib/bootstrap/service_locator/service_locator.dart`
`ProductsRepository`, `PiecesRepository`, `DesignsRepository`, etc. are created as local variables in `prepareBlocs()` and not registered in GetIt. As the app grows (new feature that needs `ProductsRepository`) the developer must manually thread dependencies through `prepareBlocs()`. Consider registering `ProductsRepository` as a GetIt singleton.



---

## 3. ROUTING

### 3-A. Top-level root constants in `routes.dart` are redundant namespace pollution
File: `lib/bootstrap/router/routes.dart:14-18`
`piecesRoot`, `collectionsRoot`, `categoriesRoot`, `designsRoot`, `contactRoot` are top-level `const` strings. Each is used exactly once as the value of a `static const path` inside a route class. Remove the top-level ones; the `static const path` is already the source of truth.

### 3-B. Back-button detection relies on hardcoded path parameter name `'id'`
File: `lib/widgets/app_bar/app_bar_left_actions.dart:12`
`GoRouterState.of(context).pathParameters.containsKey('id')` — if a future route uses a different parameter name (`:slug`, `:productId`), the back button will silently not appear. A safer approach: use `GoRouter.of(context).canPop()`.

### 3-C. Detail routes render the full parent page with a filter — not a true detail page
Files: `lib/bootstrap/router/routes.dart:76-78`, `lib/bootstrap/router/routes.dart:101-103`
`CollectionRoute` → `CollectionsPage(selectedCollectionId: id)`, `CategoryRoute` → `CategoriesPage(selectedCategoryId: id)`. The detail route instantiates the same stateful widget as the list page. Full widget rebuild on navigation, scroll restoration runs again for the filtered view, and it makes future independent detail lifecycle/state harder.

---

## 4. STATE / BLOC

### 4-A. `LanguageEvent` is not a sealed class — inconsistent with all feature bloc events
File: `lib/core/state/language_bloc/language_event.dart`
`class LanguageEvent {}` — unlike all feature bloc events (`sealed class PiecesEvent`), `LanguageEvent` is a plain class. Adding a new language event won't produce an "unhandled case" compiler warning. Fix: `sealed class LanguageEvent`.

### 4-B. `LanguageEvent` does not extend `AppBlocEvent`
File: `lib/core/state/language_bloc/language_event.dart:3`
All feature bloc events extend `AppBlocEvent`. `LanguageEvent` does not. If intentional (language is pure UI state), document this exception in ARCHITECTURE.md. Otherwise make it consistent.

### 4-C. `FetchBlocMixin._backoff` is per-bloc with no global network coordination
File: `lib/core/state/bloc_utils/fetch_bloc_mixin.dart:13`
Each bloc has its own independent `RetryBackoff`. On startup, all blocs fire simultaneously. On network failure, each bloc independently grows its backoff — no global "network is unavailable" signal prevents thundering herd retries. Consider a shared `BackoffCoordinator`.

### 4-D. Computed state getters rebuild collections on every access (not memoized)
Files:
- `lib/features/pieces/domain/bloc/pieces_state.dart:21-24` — `allDesigns`, `allPieces`
- `lib/features/designs/domain/bloc/designs_state.dart:20-25` — `designs`, `representativePieces`
- `lib/features/categories/domain/bloc/categories_state.dart:23-26` — `categoriesById`, `allPieces`
- `lib/features/collections/domain/bloc/collections_state.dart:23-26` — `collectionsById`, `allPieces`

These are computed getters on freezed classes — they call `.toList()` or build a map on every access. Every call creates a new collection object. In `build()` methods, always assign to a local variable once: `final designs = state.designs;`.

---

## 5. DATA LAYER

### 5-A. Firestore collection name strings are hardcoded inline throughout the data layer
Files: `lib/data/products_repository.dart:40-43`, `lib/features/home/repository/home_repository.dart:16`, `lib/features/contact/repository/contact_repository.dart:16`
String literals `'pieces'`, `'designs'`, `'collections'`, `'categories'`, `'miscellaneous'` are hardcoded at the call site. `utils/constants.dart` already holds `homePageImageDocId` and `ownerPhotoDocId`. Centralise all Firestore collection/document ID strings there — a typo silently returns empty data.

### 5-B. `firestore_data_parser.dart` handles `details` as both JSON string and Map
File: `lib/data/firestore_data_parser.dart:157-166`
`_toStringMapTranslations` accepts the value as either a raw `Map` or a JSON-encoded `String`. This accommodates a data inconsistency in Firestore where some documents store `details` as a serialized JSON string and others as a native Firestore map. Normalise the Firestore data and remove the JSON decode path.

### 5-C. `_toLanguage` does a linear scan for language lookup
File: `lib/data/firestore_data_parser.dart:128-133`
`for (final lang in Language.values) { if (lang.name == key) return lang; }` — O(n) per field per document parsed. Replace with a cached `Map<String, Language>` lookup at the class level, or use `Language.values.firstWhereOrNull((l) => l.name == key)`.

---

## 6. LOCALIZATION

### 6-A. `Translation.story` is a live enum case for a commented-out feature
File: `lib/localization/translation.dart:8`
`Translation.story` is translated in `en.dart` and `fi.dart` but the Story route is entirely commented out. Either remove the key or restore the route. Dead enum cases add confusion in exhaustive switches.

### 6-B. `AppLocale.of()` uses `FlutterError` — should use `assert`
File: `lib/localization/app_locale.dart:16-23`
Flutter's idiomatic "not found in tree" pattern uses an `AssertionError`/`assert` in debug mode. `FlutterError` is for rendering/layout errors. Use: `assert(locale != null, 'No AppLocale found...')` then `return locale!`.

### 6-C. `isSupported` iterates an `Iterable` with `contains` — O(n) on every locale resolution
File: `lib/localization/app_locale.dart:44`
`AppLocale.supportedLocales.contains(locale)` — `supportedLocales` returns a lazy `Iterable<Locale>`, so `contains` is O(n). Convert to a `Set` for O(1) lookup.

---

## 7. THEME / STYLE

### 7-A. `headlineSmall` is named "headline" but sized identically to body text
File: `lib/theme/app_theme.dart:29-33`
`headlineSmall` is 14px at w500 — the same size as `bodyMedium` (14px w400). A "headline" should be visually distinct from body text. The naming misleads readers of the theme. Consider a custom theme extension or a better-named slot.

### 7-B. `AppIcons.contact` and `AppIcons.email` are duplicate icons
File: `lib/theme/app_icons.dart:11,23`
Both are `Symbols.email_rounded`. If the drawer icon for "Contact" should be different from the in-page email icon, use separate icon values.

### 7-C. `AppIcons.noImage` and `AppIcons.pieces` are duplicate icons
File: `lib/theme/app_icons.dart:9,25`
Both are `Symbols.local_cafe_rounded`. The coffee cup serves as both the nav icon for "Pieces" and the "no image" placeholder. Use a semantic icon for no-image (`Symbols.image_not_supported_rounded`).

### 7-D. `AppGaps` is missing steps that `AppDimensions` defines
File: `lib/utils/app_gaps.dart`
`AppDimensions` defines `spacing15` and `spacing25`. `AppGaps` has no `h15` or `h25`. Code uses inline `SizedBox(width: AppDimensions.spacing15)` when gap widgets are missing — inconsistent pattern.

### 7-E. `colors.dart` uses verbose `Color.fromARGB(255, 255, 255, 255)` for white
File: `lib/theme/colors.dart:3`
`Colors.white` (or `const Color(0xFFFFFFFF)`) is more readable and immediately communicates intent.

### 7-F. `app_status_bar_color.dart` uses raw color constants before theme is available
File: `lib/theme/app_status_bar_color.dart:8-9`
`statusBarColor: pale` — raw constant. On future dark-mode support, this would need to be dynamic. At minimum, document that this is called before `runApp()` and cannot be theme-driven.

---

## 8. WIDGETS — SHARED

### 8-A. `Photo` class is defined inside `photo_with_fallback.dart` but used widely
File: `lib/widgets/photo_with_fallback/photo_with_fallback.dart:9-19`
`Photo` is used in `piece_card.dart`, `photo_and_info.dart`, `home_page.dart`, and `piece_photos.dart`. A model class used by many unrelated files should have its own file (e.g., `lib/widgets/photo_with_fallback/photo.dart`) or live in a shared model location, not be embedded in a widget implementation file.

### 8-B. `PhotoWithFallback` calls `getIt<AppLogger>()` directly — service locator anti-pattern in presentation
File: `lib/widgets/photo_with_fallback/photo_with_fallback.dart:218`
Widgets should receive dependencies through the widget tree (constructor, `BuildContext`, `BlocProvider`), not reach into the service locator. This breaks testability (must initialise GetIt to unit-test this widget) and couples presentation to the DI framework. Pass `AppLogger` as a constructor parameter or access via `context.read<AppLogger>()` if provided up the tree.

### 8-C. `ProgressIndicatorXL` and `NoImageIconPlaceholder` use `Timer(Duration.zero, ...)` anti-pattern
Files: `lib/widgets/progress_indicator/progress_indicator_xl.dart:36-48`, `lib/widgets/photo_with_fallback/no_image_icon_placeholder.dart:68-79`
Using `Timer(Duration.zero, ...)` to defer `Theme.of(context)` access is fragile and unnecessary. The canonical approach is `didChangeDependencies()` — called after `initState` with a valid context and re-called whenever an `InheritedWidget` changes. The `Timer` pattern risks firing after `dispose()` and adds microtask overhead.

### 8-D. `NoImageIconPlaceholder.build` returns empty `Container()` before animation is ready — causes layout flash
File: `lib/widgets/photo_with_fallback/no_image_icon_placeholder.dart:33`
`if (_animation == null) return Container();` — zero-size widget for one frame before the timer fires, causing a layout shift. Return a correctly-sized container: `Container(width: widget.size.width, height: widget.size.height)`.

### 8-E. `AppBarRightActions` wraps a single widget in a `Row` unnecessarily
File: `lib/widgets/app_bar/app_bar_right_actions.dart:19-35`
A `Row` with one child adds nothing — the `ActionButton` would align correctly on its own. The inline comment explaining this is a placeholder for future children is exactly the kind of rationale that belongs in a PR description, not the code. Remove the `Row` until there are multiple children.

### 8-F. `TitleWithHoverEffectState` is a public state class — should be private
File: `lib/widgets/items_grid/title_with_hover_effect.dart:28`
`class TitleWithHoverEffectState` should be `_TitleWithHoverEffectState`. State classes should always be private unless exposed via `GlobalKey`, which is not the case here.

### 8-G. `HorizontalNavigation._measureText` adds magic number `+ 30.0`
File: `lib/widgets/horizontal_navigation/horizontal_navigation.dart:41`
`return tp.width + 30.0;` — 30.0 represents padding around each nav text button but is unnamed. Note that `AppDimensions.navItemPaddingEstimate = 40.0` already exists and is close — reconcile or use one constant.

### 8-H. `HorizontalNavigation` creates `TextPainter` objects on every `didChangeDependencies` call
File: `lib/widgets/horizontal_navigation/horizontal_navigation.dart:28-33`
`_computeTotalWidth` creates and lays out a `TextPainter` per route item on every dependency change, including every window resize. For a web app this fires frequently. Memoize by caching the result keyed on text style + locale.

### 8-I. `DrawerForAppBar` detects current page via `ModalRoute.of(context)?.settings` — fragile with go_router
File: `lib/widgets/drawer/drawer_for_app_bar.dart:45-48`
`ModalRoute.of(context)?.settings` + `is NoTransitionPage` check is go_router-implementation-specific and may break with router configuration changes. Use `GoRouterState.of(context).uri.path` and compare against `route.path()`.

### 8-J. `DrawerRouteItem` uses `GestureDetector` instead of `InkWell`
File: `lib/widgets/drawer/drawer_route_item.dart:44`
`GestureDetector` for a tappable list item loses Material ink splash feedback. `InkWell` with `onTap` and `onHover` provides proper visual feedback and is idiomatic for list items. The nested `HoverDetector` + `GestureDetector` could be flattened into a single `InkWell`.

### 8-K. `ItemsGrid.scrollTargetName` passes `id` for both `categoryId` and `collectionId` parameters
File: `lib/widgets/items_grid/items_grid.dart:43`
`mode.scrollTargetName(id, id, isHorizontal: true)` — passes the same value for both semantically different parameters. The wrong argument is silently ignored based on `ViewMode`. Semantically incorrect even though the resulting string is correct today. Refactor `scrollTargetName` to accept a single `groupId` parameter.

### 8-L. `ItemsGrid` has an unresolved `FIXME` for a test horizontal overflow issue
File: `lib/widgets/items_grid/items_grid.dart:84-85`
`// FIXME: This component works in development and production, but fails in tests due to horizontal overflow.` — a known test failure is being tolerated. Root cause should be investigated and fixed (likely a `Row` inside an unbounded width in the test environment).

### 8-M. `Company` widget ignores `isCentered` for column alignment — dead parameter bug
File: `lib/widgets/company/company.dart:20`
The conditional `crossAxisAlignment` line is commented out and replaced with hardcoded `CrossAxisAlignment.center`. The `isCentered` parameter is accepted but has no effect on the column layout — only on `textAlign` of the subtitle. This is either a regression (accidentally dropped the conditional) or a dead parameter.

### 8-N. `DrawerHeaderItem` has a superfluous outer `Column` with a single child
File: `lib/widgets/drawer/drawer_header_item.dart:17-29`
`Container` → `Column` (1 child: `Padding`) → `Row` — the outer `Column` adds a widget tree node with no benefit. Flatten to `Container` → `Padding` → `Row`.

### 8-O. `Footer._routes` wraps each `TextButton.child` in a single-child `Column`
File: `lib/widgets/footer/footer.dart:42-45`
`child: Column(children: [Text(...)])` — a `Column` with a single `Text` child. The `Text` should be the direct child of `TextButton`.

### 8-P. `Footer._routes` returns `Iterable<TextButton>` rather than `List<TextButton>`
File: `lib/widgets/footer/footer.dart:35`
Returning a lazy `Iterable` that is then spread with `[...routes]` is less explicit than returning a `List`. Return type should be `List<TextButton>` and call `.toList()` inside.

---

## 9. FEATURES — PRESENTATION

### 9-A. `HomePage` uses two nested `BlocBuilder`s — `BlocSelector` would be cleaner
File: `lib/features/home/presentation/pages/home_page.dart:21-71`
`BlocBuilder<LanguageBloc>` wraps `BlocBuilder<HomeBloc>`. Use independent `BlocSelector`s for each field to reduce rebuild coupling and nesting depth.

### 9-B. `HomePage._headlineStyle` has a formatting error — method body misaligned
File: `lib/features/home/presentation/pages/home_page.dart:75-78`
The `return` statement is at the same indentation level as the method declaration, not indented inside the body. Run `dart format`.

### 9-C. Private helper style methods on stateless widgets should be `static` or top-level
Files: `lib/features/home/presentation/pages/home_page.dart`, `lib/features/contact/presentation/contact_view/contact_form.dart`, `lib/features/pieces/presentation/single_piece_view/design_description.dart`
Methods like `_headlineStyle`, `_subTitleStyle`, `_mainDescriptionStyle` receive `BuildContext` and access no instance state. They should be `static` or top-level private functions. Instance methods that don't use `this` mislead readers about why they're instance methods.

### 9-D. `SinglePieceView` has excessive BlocBuilder nesting depth
File: `lib/features/pieces/presentation/single_piece_view/single_piece_view.dart`
`BlocBuilder<PiecesBloc>` → `BlocStatusView` → `BlocSelector<LanguageBloc>` → `LayoutBuilder` → `Column`. The language selector should be higher up or passed as a parameter from the page level to reduce nesting.

### 9-E. `photo_and_info.dart` uses `homePageImageDocId` as the id for the owner photo
File: `lib/features/contact/presentation/contact_view/photo_and_info.dart:53`
`Photo(id: homePageImageDocId, ...)` — the `id` field should be `ownerPhotoDocId`. Using the wrong doc ID means if `PhotoWithFallback` ever uses `id` as a cache key and both photos are in the widget tree simultaneously, they will collide.

### 9-F. `ContactEmailWithCopyOption` silently discards clipboard errors
File: `lib/features/contact/presentation/contact_view/contact_email_with_copy_option.dart:25`
`} catch (_) {}` — no logging, no user feedback on clipboard failure. At minimum log via `AppLogger.logWarning`.

### 9-G. `ContactForm` maintains live `TextEditingController`s for a permanently disabled form
File: `lib/features/contact/presentation/contact_view/contact_form.dart`
The submit button is `onPressed: null`. Two `TextEditingController`s add lifecycle overhead for a form that has no functional purpose yet. Simplify to a static display until the mail service is available.

### 9-H. `PiecePhotos._controller` is nullable but always assigned — should be `late final`
File: `lib/features/pieces/presentation/single_piece_view/piece_photos.dart:18`
`PageController? _controller` is declared nullable but is always initialized in `initState` and never reset. Should be `late final PageController _controller`.

### 9-I. `ContactPage` horizontal vs vertical layout swaps component order unexpectedly
File: `lib/features/contact/presentation/pages/contact_page.dart:31-45`
Horizontal: `[PhotoAndInfo, ContactForm]`. Vertical: `[ContactForm, PhotoAndInfo]` (reversed). Whether intentional UX or not, this is undocumented and surprising. Document or make consistent.

### 9-J. `DesignDescription._mainDescriptionStyle` uses forced `!` unwrap on `textTheme.bodyMedium`
File: `lib/features/pieces/presentation/single_piece_view/design_description.dart:63`
`Theme.of(context).textTheme.bodyMedium!` — forced unwrap. Use `?? const TextStyle()` for consistency with the rest of the codebase.

### 9-K. `GroupedItemsView._buildItemsGridForGroup` filters `allPieces` by iterating the full list
File: `lib/widgets/grouped_items_view/grouped_items_view.dart:58-60`
`allPieces.where((p) => pieceIds.contains(p.id))` — O(n) across all pieces for each group. The parent state already has `piecesById` as a map. Pass `piecesById` instead of `allPieces` and look up pieces by ID: O(k) where k = pieces in this group.

### 9-L. `_contactEmaiLabel` variable name has a typo ("Emai" instead of "Email")
File: `lib/features/contact/presentation/contact_view/contact_email_with_copy_option.dart:17`
`final contactEmaiLabel` — missing the 'l'. Minor but incorrect naming in production code.

---

## 10. MAIN / BOOTSTRAP

### 10-A. `main.dart` swallows Firebase init exception silently
File: `lib/main.dart:17`
`} catch (_) {` — the exception is completely discarded. At minimum log to `debugPrint` before the logger is initialized so the cause of "could not connect" is visible during development.

### 10-B. `FirebaseErrorApp` is not localized — hardcoded English
File: `lib/bootstrap/app/firebase_error_app.dart:13`
`'Could not connect. Please refresh and try again.'` appears before the localization system is initialized. At minimum show both Finnish and English, or use the app's default locale (`Language.fi`).

### 10-C. `FirebaseErrorApp` uses raw color constants instead of theme colors
File: `lib/bootstrap/app/firebase_error_app.dart:12-15`
`app_colors.background` and `app_colors.medium` are used directly. Since `FirebaseErrorApp` creates its own `MaterialApp`, it could include `theme: const AppTheme().themeData` and use `Theme.of(context).colorScheme`.

### 10-D. Explanatory comment in `main.dart` about `getIt` violates no-obvious-comments rule
File: `lib/main.dart:22-24`
`// Note: We use the getIt service locator to help us manage our dependencies...` — this explains what the code obviously does. Remove.

### 10-E. `app.dart` imports every feature bloc individually — will grow unbounded
File: `lib/bootstrap/app/app.dart:10-15`
Six explicit bloc barrel imports. Consider a top-level `lib/features/barrel.dart` or extracting the `MultiBlocProvider` setup into a dedicated widget.

### 10-F. Mixed `getIt.get<>()` and `getIt<>()` call styles in `app.dart`
File: `lib/bootstrap/app/app.dart:29,45`
Both `getIt.get<T>()` and `getIt<T>()` are used. They are equivalent but inconsistent. Standardise on the call form `getIt<T>()` throughout the codebase.

---

## 11. TESTING

### 11-A. Contact feature has no view test
`test/features/contact/` contains only `contact_bloc_test.dart`. All other features have corresponding view tests. The contact view is complex (form, photo, email copy widget). Add `contact_view_test.dart`.

### 11-B. `prepareBlocsForTests()` duplicates production `prepareBlocs()` setup
Files: `test/utils/prepare_blocs_for_tests.dart`, `lib/bootstrap/service_locator/service_locator.dart`
Any change to `prepareBlocs()` must be manually mirrored in the test version. Since `prepareBlocs()` already accepts an optional `CloudService`, it could also accept an optional `AppLogger` and be called directly from tests, eliminating the duplicate.

---

## 12. MISCELLANEOUS NAMING / CONSISTENCY

### 12-A. `AppLayoutConstants.singleRowSubtraction` has an unclear name
File: `lib/utils/app_layout_constants.dart:2`
`singleRowSubtraction = 15.0` — the name doesn't communicate what is being subtracted or why. Used in `ItemsGrid._photoSize()` when `isTheOnlySubView` is false. Rename to something descriptive (e.g., `horizontalScrollRowWidthCorrection`) or add a comment explaining the intent.

### 12-B. `AppDimensions` mixes semantic layout values with a generic spacing scale
File: `lib/utils/app_dimensions.dart`
Constants like `appBarHeight` (semantic) and `spacing5` (generic scale) live in the same class. As the app grows, separate `AppSpacing` (scale) from `AppDimensions` (semantic) for clarity.

### 12-C. `foodSafetyInfo` list and `_foodSafetyDetails` join are duplicated in `en.dart` and `fi.dart`
Files: `lib/localization/en.dart:62-73`, `lib/localization/fi.dart:60-71`
Identical list construction pattern duplicated. Move the join logic into the `translate()` method, or unify into a shared helper so the pattern only exists once.

---

---

## 13. ARCHITECTURE / CORRECTNESS — SECOND PASS

### 13-A. `validate_translations.dart` is never imported or called
File: `lib/localization/validate_translations.dart`
ARCHITECTURE.md says "validate_translations.dart catches missing keys at test time" but the file is never imported in any test file. The validation is silently not running. Wire it into `localizations_test.dart` or a dedicated test that calls `validateTranslations()` at startup.

### 13-B. go_router has no `errorBuilder` / 404 handler
File: `lib/bootstrap/router/route_controller.dart`
If a user navigates to an unknown path, go_router shows a blank white screen in release mode (the default error widget is debug-only). Add `errorBuilder: (context, state) => const NotFoundPage()` so unknown routes degrade gracefully.

### 13-C. Unsafe `as String?` casts in feature repositories
Files: `lib/features/pieces/repository/pieces_repository.dart`, `lib/features/designs/repository/designs_repository.dart`, `lib/features/categories/repository/categories_repository.dart`, `lib/features/collections/repository/collections_repository.dart`
`data['someField'] as String?` — if Firestore returns a non-string value for that field the cast throws a `TypeError` at runtime, bypassing the repository's error boundary and crashing the bloc. Use `data['someField'] is String ? data['someField'] as String : null` or add a typed helper.

### 13-D. Retry button in `BlocStatusView` is non-functional — poisoned `ProductsRepository` cache blocks recovery
Files: `lib/widgets/bloc_status_view/bloc_status_view.dart`, `lib/data/products_repository.dart`
When a fetch fails, `BlocStatusView` shows a retry button that re-dispatches the fetch event. But `ProductsRepository._cache` is already set to the failed Future (see 2-G). The re-dispatched event calls `getProducts()` which immediately returns the failed Future again — the retry button appears to work but always fails instantly. Fix 2-G first; the retry button only becomes functional after that.

### 13-E. `DesignsState.representativePieces` iterates `designs` twice
File: `lib/features/designs/domain/bloc/designs_state.dart:20-25`
`get designs` builds a list from the map; `get representativePieces` calls `designs.map(...)` — a second iteration over the newly allocated list. Both getters allocate on every call. Memoize or compute in the bloc before emission.

### 13-F. `RetryBackoff.wait()` returning `null` is a production workaround for a test detail
File: `lib/core/retry/retry_backoff.dart`
Returning `null` on the first attempt (instead of `Future.value(Duration.zero)`) exists to avoid an artificial delay in tests. The correct fix is to make the base delay injectable (default 0 in tests, real value in production) rather than encoding test-awareness into production logic.

### 13-G. `BlocSelector<LanguageBloc>` nested inside `BlocBuilder<FeatureBloc>` is rebuilt on every feature state change
Files: `lib/features/pieces/presentation/pages/pieces_page.dart`, `lib/features/designs/presentation/pages/designs_page.dart`, others
When `FeatureBloc` emits any state change, the outer `BlocBuilder` rebuilds, which recreates the `BlocSelector<LanguageBloc>` widget — even if the language hasn't changed. Hoist the `BlocSelector<LanguageBloc>` above the feature `BlocBuilder`, or use `context.select<LanguageBloc, Language>(...)` at the point of use.

### 13-H. `categoriesById` and `collectionsById` are computed in closures inside widget `build` methods
Files: `lib/features/categories/presentation/pages/categories_page.dart`, `lib/features/collections/presentation/pages/collections_page.dart`
`final categoriesById = {for (final c in state.categories) c.id: c}` is built on every `build` call. This is already available as a state getter — use `state.categoriesById` directly (though see 4-D about memoisation).

### 13-I. `sold` field exists on `Piece` model but is never rendered
File: `lib/features/pieces/domain/models/piece/piece.dart`
`final bool sold;` is parsed, stored in state, and transmitted through the entire data pipeline — but no widget reads it. Either show sold status (badge, greyed card) or document that it is reserved for the purchase flow and suppress the field until then.

### 13-J. Dart 3 expression switch opportunities missed throughout
Files: `lib/localization/translations.dart`, `lib/bootstrap/router/route_enum.dart`, `lib/core/types/bloc_status/bloc_status.dart`, `lib/data/firestore_data_parser.dart`
Multiple multi-arm `switch` statements return a value but use the statement form with `return` inside each case. Dart 3 expression switches (`switch (x) { A() => ..., B() => ... }`) produce cleaner exhaustive code and the compiler enforces completeness without a `default`. This pattern is established in bloc event switches — apply it consistently everywhere.

### 13-K. `PieceCard` sets `overflow: TextOverflow.ellipsis` and `maxLines: 1` redundantly
File: `lib/widgets/items_grid/piece_card.dart`
`Text` with `overflow: TextOverflow.ellipsis` requires `maxLines` to be set; otherwise `overflow` has no effect (text wraps). Setting both is correct — but there are two separate `Text` widgets both with this pattern. Verify the outer `SizedBox` width constraint is actually bounding the text, otherwise ellipsis never fires.

### 13-L. `CrossAxisAlignment.center` is default for `Row` — redundant
Files: `lib/widgets/items_grid/piece_card.dart`, multiple widget files
`Row(crossAxisAlignment: CrossAxisAlignment.center, ...)` — `center` is the default `crossAxisAlignment` for `Row`. Remove redundant explicit declarations.

### 13-M. `showProgressIndicator` in `ProgressIndicatorPageOverlay` is always `false`
File: `lib/widgets/progress_indicator/progress_indicator_page_overlay.dart`
The flag that triggers the spinner is computed but never set to `true` in any current code path. The overlay always renders the `Stack` with an invisible indicator — unnecessary widget overhead. Either connect the flag to a real loading state or remove the overlay until it's needed.

---

## 14. TEST QUALITY

### 14-A. `localizations_test.dart` sets up full bloc infrastructure unnecessarily
File: `test/localizations_test.dart`
`setUpAndTearDownAllBlocsAndPreventNetworkImages()` initialises all blocs for a test that only verifies `Translation` enum completeness. The test has no dependency on any bloc. Remove the setup call.

### 14-B. `home_view_test.dart` is a trivial smoke test with no assertions
File: `test/features/home/home_view_test.dart`
The test pumps `HomeView` and calls `pumpAndSettle` but makes no expectations. It verifies only that the widget doesn't throw on construction. Add assertions for key UI elements (hero image placeholder, headline text, etc.).

### 14-C. `app_test.dart` has malformed indentation
File: `test/app_test.dart`
Several `expect` lines are indented inconsistently relative to the surrounding `testWidgets` block. Run `dart format test/app_test.dart`.

### 14-D. `routing_test.dart` tests a cartesian product of 60 route transitions
File: `test/routing_test.dart`
6 routes × 10 transitions = 60 test cases in a single `testWidgets` block. This makes failures hard to isolate and the test slow. Split into one test per route or use `group` + `testWidgets` per route pair.

### 14-E. Shadowed variable `routeOrder` in IIFE inside `routing_test.dart`
File: `test/routing_test.dart`
An immediately-invoked function expression shadows an outer variable. Dart's scope rules hide the bug — the inner variable wins silently. Refactor to make scope explicit.

### 14-F. `routing_utils.dart` imports `en.dart` directly
File: `test/utils/routing_utils.dart`
Test utility imports a production localization file. Tests should go through the public `Translations.translate()` interface, not access language maps directly, so that a future refactor of `en.dart` doesn't silently break test utilities.

### 14-G. `serialNumber` in `test_data.dart` is never asserted on in any test
File: `test/utils/test_data.dart`
`serialNumber: 'SN-001'` etc. are set on test pieces/designs but no test checks `serialNumber`. Either assert on it in a model test, or remove it from test data to reduce noise.

### 14-H. `HorizontalNavigation` uses `TextPainter` with a magic constant `+ 900`
File: `lib/widgets/horizontal_navigation/horizontal_navigation.dart` (test branch)
The `+900` offset applied in test environments (detected via `kIsTest`) to work around the `TextPainter` layout issue is a hack. Document why 900 was chosen, or fix the root issue (likely the test environment not providing a real `ParagraphBuilder`).

### 14-I. Two different photos share the same default filename in mock helpers
File: `test/utils/mock_cloud_service_helpers.dart`
The hero image and owner photo both default to the same filename string in mock data. If `PhotoWithFallback` ever caches by filename these will collide in tests — same issue as 9-E but in test data.

---

## 15. LOCALIZATION / DATA

### 15-A. `foodSafetyInfo` is a public top-level function in both `en.dart` and `fi.dart` — symbol collision risk
Files: `lib/localization/en.dart:62`, `lib/localization/fi.dart:60`
Both files define a top-level function with the same name `foodSafetyInfo`. Dart will not complain as long as both aren't imported into the same file without a prefix — but if they ever are (e.g., in a test that imports both), there will be a compile error. Move the helper inside the class/switch or make it private (`_foodSafetyInfo`).

### 15-B. Dead public export in `translations.dart`
File: `lib/localization/translations.dart`
`Translations` re-exports the `Language` enum via a public getter that nothing outside localization uses. Verify and remove unused public surface.

### 15-C. `details` dual-format confirms Firestore data inconsistency — technical debt not tracked
File: `lib/data/firestore_data_parser.dart:157-166`
Noted in 5-B but worth flagging separately: the dual-format handling was added as a workaround for inconsistent Firestore data. This workaround has no associated TODO linking it to a data migration task. Add a `// TODO(owner): migrate all Firestore details fields to Map; remove JSON decode path` comment or track it externally.

### 15-D. `fromJson` generated by `json_serializable` is dead code for blocs
Files: `lib/features/pieces/domain/models/piece/piece.freezed.dart`, similar
`fromJson` factory constructors are generated for all freezed models. None are called — all data flows through `FirestoreDataParser` manual mapping. The generated code is harmless but adds ~100 lines per model to the build output. If `json_serializable` is removed from model annotations (`@freezed` without `@JsonSerializable`), the dead code disappears.

---

## 16. NAMING / DETAILS — SECOND PASS

### 16-A. `HomeBloc.isLoaded` and `ContactBloc.isLoaded` check a single nullable string field
Files: `lib/features/home/domain/bloc/home_bloc.dart`, `lib/features/contact/domain/bloc/contact_bloc.dart`
`isLoaded` returns `state.imageFileName != null` / `state.contactInfo != null`. Like 2-F, if the backend legitimately returns null for this field, `isLoaded` stays `false` and the bloc retries indefinitely. Apply the same fix recommended in 2-F.

### 16-B. `expandAll` state is local to `GroupedItemsView` and lost on navigation
File: `lib/widgets/grouped_items_view/grouped_items_view.dart`
`bool _expandAll` is `StatefulWidget` local state. Navigating away and back resets the expand state. For consistency with scroll restoration, either persist via the bloc or at minimum document this is intentional.

### 16-C. `designName` empty-string fallback is silently swallowed
File: `lib/features/pieces/domain/models/piece/piece.dart`
`designName: data['designName'] as String? ?? ''` — an empty string is treated as a valid name. Downstream, `'' ` renders nothing and is indistinguishable from "field missing from Firestore". Use `null` as the fallback and let the UI decide whether to show a placeholder.

### 16-D. `NoOpCrashReporter` methods are `async` for no reason
File: `lib/core/crash_reporting/no_op_crash_reporter.dart`
`Future<void> report(...) async {}` — the `async` keyword on an empty method allocates a `Future<void>` on every call (microtask queue). Use `void report(...) {}` instead and adjust the `CrashReporter` interface if needed.

### 16-E. `_padding()` helper in `PieceCard` is an instance method returning a const value — should be `static const`
File: `lib/widgets/items_grid/piece_card.dart`
`EdgeInsets _padding() => const EdgeInsets.symmetric(horizontal: 8.0)` — this is a zero-argument instance method returning a constant. Declare it `static const _padding = EdgeInsets.symmetric(horizontal: 8.0)` to remove the call overhead and signal immutability.

### 16-F. `_decoration()` in `PieceCard` is an instance method that doesn't use `this` — should be `static`
File: `lib/widgets/items_grid/piece_card.dart`
Same pattern as 16-E. Instance methods that don't access instance state should be `static` (or top-level private) to make it clear they have no side effects on the object.

### 16-G. `ProgressIndicatorPageOverlay` always renders a `Stack` even when the overlay is hidden
File: `lib/widgets/progress_indicator/progress_indicator_page_overlay.dart`
When `showProgressIndicator` is false the overlay `Container` is invisible but the `Stack` is still in the widget tree with its `children` list. Use `if (showProgressIndicator) ...` inside `children` to avoid the unnecessary node.

### 16-H. Stale `// Note:` comments throughout
Files: `lib/main.dart:22-24`, `lib/bootstrap/service_locator/service_locator.dart:52`, `lib/widgets/app_bar/app_bar_right_actions.dart:23`, others
Multiple `// Note:` comments explain what the adjacent code obviously does — directly violating the project's no-obvious-comments rule. Audit and remove all `// Note:` comments that restate the code rather than explaining a non-obvious constraint.

---

_End of full audit. ~105 findings across all layers._
_Priority bugs (incorrect behaviour): 2-E, 2-F, 2-G, 13-D, 1-C, 9-E, 13-C, 13-A._
_Priority architecture: 2-A, 2-B, 8-B, 13-B, 13-G, 11-B._
