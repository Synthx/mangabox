import 'package:freezed_annotation/freezed_annotation.dart';

import 'navigation_item.dart';

part 'navigation_menu_state.freezed.dart';

@freezed
class NavigationMenuState with _$NavigationMenuState {
  const factory NavigationMenuState({
    required List<NavigationItem> items,
    required int selectedIndex,
  }) = _NavigationMenuState;
}
