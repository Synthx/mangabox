import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_item.freezed.dart';

@freezed
class NavigationItem with _$NavigationItem {
  const factory NavigationItem({
    required String title,
    required IconData icon,
  }) = _NavigationItem;
}
