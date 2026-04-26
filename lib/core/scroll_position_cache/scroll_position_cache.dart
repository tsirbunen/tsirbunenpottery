class ScrollPositionCache {
  final Map<String, double> _positions = {};

  // 0.0 = scroll to top when no position has been cached yet for this target
  double get(String target) => _positions[target] ?? 0.0;

  void set(String target, double position) {
    _positions[target] = position;
  }
}
