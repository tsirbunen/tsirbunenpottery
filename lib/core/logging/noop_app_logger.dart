import 'package:tsirbunenpottery/core/logging/app_logger.dart';

class NoOpAppLogger implements AppLogger {
  const NoOpAppLogger();

  @override
  void logInfo(String message, {String tag = 'App'}) {}

  @override
  void logWarning(String message, {String tag = 'App', Object? error}) {}

  @override
  void logError(
    String message, {
    required Object error,
    StackTrace? stackTrace,
    String tag = 'App',
  }) {}
}
