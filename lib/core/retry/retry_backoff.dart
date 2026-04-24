import 'dart:math';

class RetryBackoff {
  int _consecutiveFailures = 0;
  static const _cap = Duration(seconds: 20);

  Future<void> wait() async {
    if (_consecutiveFailures == 0) return;
    final seconds = min(pow(2, _consecutiveFailures - 1).toInt(), _cap.inSeconds);
    await Future.delayed(Duration(seconds: seconds));
  }

  void recordSuccess() => _consecutiveFailures = 0;
  void recordFailure() => _consecutiveFailures++;
}
