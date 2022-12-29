import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_item.dart';
import 'navigation_menu_state.dart';

class NavigationMenuStore extends Cubit<NavigationMenuState> {
  NavigationMenuStore({
    required int selectedIndex,
  }) : super(NavigationMenuState(
          items: [
            const NavigationItem(
              title: 'Nouveautés',
              icon: Icons.layers_outlined,
            ),
            const NavigationItem(
              title: 'Collection',
              icon: Icons.auto_stories_outlined,
            ),
          ],
          selectedIndex: selectedIndex,
        ));
}
