abstract interface class CrashReporter {
  void recordError(Object error, StackTrace? stackTrace, {bool fatal = false});
  void log(String message);
}
