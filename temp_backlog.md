



**H9** (Global)
Category: Architecture / Testability
No abstract interfaces for repositories. Concrete classes are registered directly in GetIt, making them unswappable in unit tests without real Firebase. Add `abstract interface class IProductsRepository` etc. and register implementations against the interfaces.










## MEDIUM


**M2** `core/types/bloc_status/bloc_status.dart:12`
Category: Error Handling
`message` is optional even on error states. An `BlocStatus(Status.error)` with no message is useless for debugging. Add `final Object? originalError; final StackTrace? stackTrace;` and make `message` required when status is error.

**M3** `data/products_repository.dart:31`
Category: Caching / Data Freshness
`_cache` has no TTL or invalidation path. If the owner updates Firestore while the app is open, the UI shows stale data permanently. Add a cache expiry timestamp or a manual refresh event.




**M6** `localization/app_locale.dart:16`
Category: Null Safety
`Localizations.of<AppLocale>(context, AppLocale)!` force-unwraps. In any widget outside the localization scope (e.g. unit test, dialog) this crashes. Return a sensible default or `throw` a descriptive error.

**M8** `widgets/items_grid/items_grid.dart:81-82`
Category: Testing / Known Bug
FIXME comment acknowledges that the widget fails in tests due to horizontal overflow. Fix the test setup (wrap in `SizedBox` with explicit constraints) or convert to a tracked issue. Leaving an acknowledged broken test in production code is not acceptable.

**M9** `widgets/horizontal_navigation/horizontal_navigation.dart:72-79`
Category: Performance
`TextPainter` is instantiated fresh for every navigation label on every `build()`. Cache computed widths in a `late final` map initialized once in `initState`.




**M16** All BLoC files
Category: Observability
`_onFetch()` silently drops events when `isLoading == true`. During development this masks unexpected double-dispatches. Add a debug-level log: `_logger.debug('FetchXxx dropped — already loading')`.

**M17** `features/pieces/presentation/single_piece_view/single_piece_view.dart:34-40`
Category: UX / Error Handling
If a piece ID is missing from the cache (stale link, bad navigation), the user sees generic text with no recovery action. Add a "back to all pieces" button or auto-pop after a short delay.

**M18** `localization/validate_translations.dart:4`
Category: Architecture / FIXME
FIXME comment: translation completeness is validated at test runtime, not compile time. Use `build_runner` to generate a lookup that fails compilation when a key is missing.



**M20** `data/products_repository.dart:140`
Category: Type Safety
Manual `as List<dynamic>` casting against expected Firestore schema. Consider using `json_serializable` (already in the project) for Firestore model deserialization to validate document shape at the data boundary.

**M22** `bootstrap/service_locator/service_locator.dart:34`
Category: Observability
Logs are fully silenced in release mode. This makes production debugging extremely hard. Use log levels instead: keep `warning` and `error` enabled in release; only suppress `debug` and `verbose`.

**M23** `bootstrap/service_locator/service_locator.dart:37`
Category: Code Quality
`cloudService ??= FirestoreCloudService()` modifies a parameter in-place inside the function body. This is a confusing mutation pattern. Assign to a local variable: `final service = cloudService ?? FirestoreCloudService()`.



**M26** `features/home/presentation/pages/home_page.dart:73-81`
Category: Code Quality
`_subTitleStyle()` and `_mainDescriptionStyle()` are near-identical getters that differ only in font size and weight. Merge into a single `_textStyle({required double size, FontWeight weight = FontWeight.normal})` helper.



---

## LOW

**L3** `bootstrap/router/routes.dart`
Category: Comment
Comment apologetically notes that `part` files are discouraged. If code gen is the accepted trade-off, just leave a one-line note about why — remove the hand-wringing.

**L4** Various widget files
Category: Const Correctness
Multiple const-eligible widgets are missing the `const` keyword. Run `flutter analyze` and address all `prefer_const_constructors` and `prefer_const_literals_to_create_immutables` lints.

**L5** All feature BLoC files
Category: Naming
`_onFetch` is the private handler name in every BLoC. When a breakpoint or log message fires, it's hard to tell which BLoC you're in. Rename to `_onFetchPieces`, `_onFetchDesigns`, etc.


**L7** (Global)
Category: Testing
No unit tests for any repository or BLoC. Production-grade apps require near-100% unit test coverage on business logic. Add `bloc_test` tests for all BLoCs and `mockito`/`mocktail` fakes for repositories.

**L8** (Global)
Category: Observability
No crash reporting integration (Sentry, Firebase Crashlytics). Errors are logged locally but never reported to an external service. Add Crashlytics before public launch.

**L9** `core/logging/dev_app_logger.dart:9,14,23`
Category: Code Quality / DRY
`tag = 'App'` default parameter is copy-pasted across three separate method signatures. Extract as `static const String _defaultTag = 'App'` and reference it.



**L13** `features/contact/presentation/contact_view/contact_email_with_copy_option.dart:34`
Category: Error Handling
`catch (_) {}` swallows clipboard errors silently. At minimum log at debug level so developers know when clipboard access fails (common on some browsers).



**L15** `widgets/app_bar/app_bar_customized.dart:6-8`
Category: FIXME / Technical Debt
FIXME comment: "as long as the app is only web...". This is untracked technical debt. Convert to a GitHub issue or remove if not planned.



