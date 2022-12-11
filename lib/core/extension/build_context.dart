import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get safePaddingTop {
    return MediaQuery.of(this).padding.top;
  }

  double get safePaddingBottom {
    return MediaQuery.of(this).padding.bottom;
  }

  Color? get primaryTextColor {
    return Theme.of(this).textTheme.displayLarge?.color;
  }

  Color? get secondaryTextColor {
    return Theme.of(this).textTheme.displayLarge?.color;
  }
}
