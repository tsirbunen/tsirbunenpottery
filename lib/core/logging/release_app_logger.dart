import 'dart:async';

import 'package:tsirbunenpottery/core/crash_reporting/crash_reporter.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';

class ReleaseAppLogger implements AppLogger {
  final CrashReporter _crashReporter;

  const ReleaseAppLogger(this._crashReporter);

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
  }) {
    unawaited(_crashReporter.recordError(error, stackTrace));
  }
}
