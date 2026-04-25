import 'dart:math';

class RetryBackoff {
  int _consecutiveFailures = 0;
  static const _cap = Duration(seconds: 20);

  /// Returns null immediately (no async boundary) when no delay is needed
  /// (that is for the tests where dalays cause isses).
  /// Returns a Future only when a real backoff delay applies.
  Future<void>? wait() {
    if (_consecutiveFailures == 0) return null;
    final seconds = min(pow(2, _consecutiveFailures - 1).toInt(), _cap.inSeconds);
    return Future.delayed(Duration(seconds: seconds));
  }

  void recordSuccess() => _consecutiveFailures = 0;
  void recordFailure() => _consecutiveFailures++;
}
