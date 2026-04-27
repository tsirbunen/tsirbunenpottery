abstract interface class CrashReporter {
  Future<void> recordError(Object error, StackTrace? stackTrace, {bool fatal = false});
  Future<void> log(String message);
}
