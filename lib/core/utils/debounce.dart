import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final Duration delay;

  Debounce({
    required this.delay,
  });

  Timer? _timer;

  void call(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, () => callback());
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
