import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get safePaddingTop {
    return MediaQuery.of(this).padding.top;
  }

  double get safePaddingBottom {
    return MediaQuery.of(this).padding.bottom;
  }
}
