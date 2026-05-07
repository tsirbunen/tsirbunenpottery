import 'package:tsirbunenpottery/core/crash_reporting/crash_reporter.dart';

final class NoOpCrashReporter implements CrashReporter {
  const NoOpCrashReporter();

  @override
  void recordError(Object error, StackTrace? stackTrace, {bool fatal = false}) {}

  @override
  void log(String message) {}
}
