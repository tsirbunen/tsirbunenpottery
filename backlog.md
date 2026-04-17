                                                                                    
Here's the senior-engineer read. Organized from most to least fundamental:

  ---
  1. Zero test coverage

  All BLoC test files exist but are empty shells. The test infrastructure is there (bloc_test, mocktail in pubspec) but completely
   unused. There's also a validate_translations.dart that ARCHITECTURE.md claims catches missing keys — but the tests are
  unimplemented, so that safety net is fake. This is the single biggest quality gap.



  ---
  7. Error states are dead ends for users

  BlocStatusView shows a generic error string and nothing else — no retry button, no differentiation between "no network" and
  "data corrupt." All errors collapse into the same UI. At minimum, recoverable errors need a retry action.









  ---
  1. Zero test coverage

  All BLoC test files exist but are empty shells. The test infrastructure is there (bloc_test, mocktail in pubspec) but completely
   unused. There's also a validate_translations.dart that ARCHITECTURE.md claims catches missing keys — but the tests are
  unimplemented, so that safety net is fake. This is the single biggest quality gap.



  ---
  4. Silent data loss in repository transformations

  products_repository.dart — the transformation methods (toDesign, toPiece, toCategory) silently drop items when references don't
  resolve, with catch (_) { continue; } swallowing exceptions. A Firestore schema change, a bad document, or a missing field
  produces an app that renders fewer items with no indication that data was lost. This needs validation + logging + propagation.


  7. Error states are dead ends for users

  BlocStatusView shows a generic error string and nothing else — no retry button, no differentiation between "no network" and
  "data corrupt." All errors collapse into the same UI. At minimum, recoverable errors need a retry action.




  1. Zero test coverage

  All BLoC test files exist but are empty shells. The test infrastructure is there (bloc_test, mocktail in pubspec) but completely
   unused. There's also a validate_translations.dart that ARCHITECTURE.md claims catches missing keys — but the tests are
  unimplemented, so that safety net is fake. This is the single biggest quality gap.





  3. Tests are broken                                                                                                                                  
  products_bloc_test.dart lines 39 and 47 call ProductsRepository() with no arguments, but the constructor requires CommonCloudService. These tests
  don't compile. Nobody is running the tests.                                                                           

                                                                                                                                    
  9. Contact form is a dead stub                                                                                                                       
  A visible submit button that does nothing is a UX lie. Fix: either wire it up or hide the button until implemented.
                                                                                                                                                       
  10. Test setup bypasses constructor requirements
  ProductsRepository() called without its required CommonCloudService in tests — tests either don't compile or use a hole in the API. Fix: pass a      
  mock/fake, establish the real constructor contract in tests.   

                                                                                                                                       
