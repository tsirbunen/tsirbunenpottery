abstract interface class AppLogger {
  void logDebug(String message, {String tag});
  void logInfo(String message, {String tag});
  void logWarning(String message, {String tag, Object? error});
  void logError(
    String message, {
    required Object error,
    StackTrace? stackTrace,
    String tag,
  });
}
