import 'dart:developer' as dev;

import 'package:tsirbunenpottery/core/logging/app_logger.dart';

class DevAppLogger implements AppLogger {
  const DevAppLogger();

  @override
  void logInfo(String message, {String tag = 'App'}) {
    dev.log(message, name: tag, level: 800);
  }

  @override
  void logWarning(String message, {String tag = 'App', Object? error}) {
    dev.log(message, name: tag, level: 900, error: error);
  }

  @override
  void logError(
    String message, {
    required Object error,
    StackTrace? stackTrace,
    String tag = 'App',
  }) {
    dev.log(
      message,
      name: tag,
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
