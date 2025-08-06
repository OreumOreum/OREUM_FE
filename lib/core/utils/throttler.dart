import 'dart:ui';

class Throttler {
  final Duration duration;
  DateTime? _lastRun;

  Throttler({required this.duration});

  void run(VoidCallback action) {
    final now = DateTime.now();
    if (_lastRun == null || now.difference(_lastRun!) > duration) {
      _lastRun = now;
      action();
    }
  }
}