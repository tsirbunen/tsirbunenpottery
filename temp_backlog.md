

## 9. FEATURES — PRESENTATION



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




## 13. ARCHITECTURE / CORRECTNESS — SECOND PASS



### 13-D. Retry button in `BlocStatusView` is non-functional — poisoned `ProductsRepository` cache blocks recovery
Files: `lib/widgets/bloc_status_view/bloc_status_view.dart`, `lib/data/products_repository.dart`
When a fetch fails, `BlocStatusView` shows a retry button that re-dispatches the fetch event. But `ProductsRepository._cache` is already set to the failed Future (see 2-G). The re-dispatched event calls `getProducts()` which immediately returns the failed Future again — the retry button appears to work but always fails instantly. Fix 2-G first; the retry button only becomes functional after that.

### 13-F. `RetryBackoff.wait()` returning `null` is a production workaround for a test detail
File: `lib/core/retry/retry_backoff.dart`
Returning `null` on the first attempt (instead of `Future.value(Duration.zero)`) exists to avoid an artificial delay in tests. The correct fix is to make the base delay injectable (default 0 in tests, real value in production) rather than encoding test-awareness into production logic.

### 13-G. `BlocSelector<LanguageBloc>` nested inside `BlocBuilder<FeatureBloc>` is rebuilt on every feature state change
Files: `lib/features/pieces/presentation/pages/pieces_page.dart`, `lib/features/designs/presentation/pages/designs_page.dart`, others
When `FeatureBloc` emits any state change, the outer `BlocBuilder` rebuilds, which recreates the `BlocSelector<LanguageBloc>` widget — even if the language hasn't changed. Hoist the `BlocSelector<LanguageBloc>` above the feature `BlocBuilder`, or use `context.select<LanguageBloc, Language>(...)` at the point of use.

### 13-H. `categoriesById` and `collectionsById` are computed in closures inside widget `build` methods
Files: `lib/features/categories/presentation/pages/categories_page.dart`, `lib/features/collections/presentation/pages/collections_page.dart`
`final categoriesById = {for (final c in state.categories) c.id: c}` is built on every `build` call. This is already available as a state getter — use `state.categoriesById` directly (though see 4-D about memoisation).


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





### 15-C. `details` dual-format confirms Firestore data inconsistency — technical debt not tracked
File: `lib/data/firestore_data_parser.dart:157-166`
Noted in 5-B but worth flagging separately: the dual-format handling was added as a workaround for inconsistent Firestore data. This workaround has no associated TODO linking it to a data migration task. Add a `// TODO(owner): migrate all Firestore details fields to Map; remove JSON decode path` comment or track it externally.


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




### 16-H. Stale `// Note:` comments throughout
Files: `lib/main.dart:22-24`, `lib/bootstrap/service_locator/service_locator.dart:52`, `lib/widgets/app_bar/app_bar_right_actions.dart:23`, others
Multiple `// Note:` comments explain what the adjacent code obviously does — directly violating the project's no-obvious-comments rule. Audit and remove all `// Note:` comments that restate the code rather than explaining a non-obvious constraint.

---

_End of full audit. ~105 findings across all layers._
_Priority bugs (incorrect behaviour): 2-E, 2-F, 2-G, 13-D, 1-C, 9-E, 13-C, 13-A._
_Priority architecture: 2-A, 2-B, 8-B, 13-B, 13-G, 11-B._
