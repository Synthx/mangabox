import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/theme/theme.dart';

import 'main_store.dart';
import 'navigation_menu/navigation_menu.dart';

class MainScreenNavigationButton extends StatelessWidget {
  const MainScreenNavigationButton({Key? key}) : super(key: key);

  void _openNavigationMenu({
    required BuildContext context,
  }) async {
    final store = context.read<MainScreenStore>();
    final page = await showDialog<int>(
      useSafeArea: false,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => const NavigationMenu(
        selectedIndex: 0,
      ),
    );

    if (page != null) {
      store.changePage(page: page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _openNavigationMenu(
        context: context,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusFull),
        ),
      ),
      label: const Icon(
        Icons.expand_more,
        size: 20,
      ),
      icon: const Text(
        'Nouveautés',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
    );
  }
}
