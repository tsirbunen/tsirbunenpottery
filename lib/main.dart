import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/bootstrap/app/app.dart';
import 'package:tsirbunenpottery/bootstrap/app/firebase_error_app.dart';
import 'package:tsirbunenpottery/core/crash_reporting/no_op_crash_reporter.dart';
import 'package:tsirbunenpottery/core/logging/dev_app_logger.dart';
import 'package:tsirbunenpottery/core/logging/release_app_logger.dart';
import 'package:tsirbunenpottery/theme/app_status_bar_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setAppStatusBarColor();

  final logger = kReleaseMode
      ? ReleaseAppLogger(const NoOpCrashReporter())
      : const DevAppLogger();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).timeout(const Duration(seconds: 10));
  } catch (e, st) {
    logger.logError('Firebase init failed', error: e, stackTrace: st);
    runApp(const FirebaseErrorApp());
    return;
  }

  prepareBlocs(logger: logger);
  runApp(const App());
}
