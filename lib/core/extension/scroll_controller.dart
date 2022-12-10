import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  bool get hasReachedBottom {
    return position.pixels >= position.maxScrollExtent * 0.85;
  }
}
