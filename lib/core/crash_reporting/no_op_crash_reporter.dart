import 'package:tsirbunenpottery/core/crash_reporting/crash_reporter.dart';

final class NoOpCrashReporter implements CrashReporter {
  const NoOpCrashReporter();

  @override
  Future<void> recordError(Object error, StackTrace? stackTrace, {bool fatal = false}) async {}

  @override
  Future<void> log(String message) async {}
}
