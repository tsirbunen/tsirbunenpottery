import 'dart:developer' as dev;

import 'package:tsirbunenpottery/core/logging/app_logger.dart';

class ReleaseAppLogger implements AppLogger {
  const ReleaseAppLogger();

  static const String _defaultTag = 'App';

  @override
  void logDebug(String message, {String tag = _defaultTag}) {}

  @override
  void logInfo(String message, {String tag = _defaultTag}) {}

  @override
  void logWarning(String message, {String tag = _defaultTag, Object? error}) {
    dev.log(message, name: tag, level: 900, error: error);
  }

  @override
  void logError(
    String message, {
    required Object error,
    StackTrace? stackTrace,
    String tag = _defaultTag,
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
