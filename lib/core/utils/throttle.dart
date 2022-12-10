import 'dart:async';

import 'package:flutter/material.dart';

class Throttle {
  final Duration duration;

  Throttle({
    required this.duration,
  });

  Timer? _timer;

  void run(VoidCallback callback) {
    if (_timer?.isActive ?? false) return;

    _timer?.cancel();
    _timer = Timer(duration, () {});
    callback();
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
