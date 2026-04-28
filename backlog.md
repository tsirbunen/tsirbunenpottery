first clear your memory of bugs/issues that you reported earlier, start fresh.                                
  I want you to get the latest versions of files in the codebase and then start looking for things to refactor   
  or bugs.  as you go, log all issues you find to @temp_backlog.md file. report to that file all problems big    
  and small. i am interested in everything from architectural issues and library selection to variable naming.   
  and remember that the target is to make all the code super clean and super senior-like, as if it was a very    
  large very complex production app. give the severity of the issue and shortly describe the problem. add all    
  your findings to the file @temp_backlog.md as you go. you now have the permission to log your results to that  
  file. 



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


FINDING #45 — SEVERITY: HIGH (observability gap)
pieces_bloc.dart:35-37, categories_bloc.dart:37-39, etc. — Feature blocs catch errors but no logger is injected. Errors are stored in state as e.toString() without being logged with stack traces. Production errors are invisible in monitoring.







**M3** `data/products_repository.dart:31`
Category: Caching / Data Freshness
`_cache` has no TTL or invalidation path. If the owner updates Firestore while the app is open, the UI shows stale data permanently. Add a cache expiry timestamp or a manual refresh event.



**M8** `widgets/items_grid/items_grid.dart:81-82`
Category: Testing / Known Bug
FIXME comment acknowledges that the widget fails in tests due to horizontal overflow. Fix the test setup (wrap in `SizedBox` with explicit constraints) or convert to a tracked issue. Leaving an acknowledged broken test in production code is not acceptable.






**M26** `features/home/presentation/pages/home_page.dart:73-81`
Category: Code Quality
`_subTitleStyle()` and `_mainDescriptionStyle()` are near-identical getters that differ only in font size and weight. Merge into a single `_textStyle({required double size, FontWeight weight = FontWeight.normal})` helper.



---

## LOW



**L7** (Global)
Category: Testing
No unit tests for any repository or BLoC. Production-grade apps require near-100% unit test coverage on business logic. Add `bloc_test` tests for all BLoCs and `mockito`/`mocktail` fakes for repositories.



**L13** `features/contact/presentation/contact_view/contact_email_with_copy_option.dart:34`
Category: Error Handling
`catch (_) {}` swallows clipboard errors silently. At minimum log at debug level so developers know when clipboard access fails (common on some browsers).



**L15** `widgets/app_bar/app_bar_customized.dart:6-8`
Category: FIXME / Technical Debt
FIXME comment: "as long as the app is only web...". This is untracked technical debt. Convert to a GitHub issue or remove if not planned.



