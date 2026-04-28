import 'package:tsirbunenpottery/core/logging/app_logger.dart';

class NoOpAppLogger implements AppLogger {
  const NoOpAppLogger();

  static const String _defaultTag = 'App';

  @override
  void logDebug(String message, {String tag = _defaultTag}) {}

  @override
  void logInfo(String message, {String tag = _defaultTag}) {}

  @override
  void logWarning(String message, {String tag = _defaultTag, Object? error}) {}

  @override
  void logError(
    String message, {
    required Object error,
    StackTrace? stackTrace,
    String tag = _defaultTag,
  }) {}
}
