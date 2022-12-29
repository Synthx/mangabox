import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';

import '../main_store.dart';
import '../navigation_menu/navigation_menu.dart';

class CollectionScreenTitle extends StatelessWidget {
  const CollectionScreenTitle({Key? key}) : super(key: key);

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
        selectedIndex: 1,
      ),
    );

    if (page != null) {
      store.changePage(page: page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(kTitleSpacer + context.safePaddingTop + kToolbarHeight),
          TextButton.icon(
            onPressed: () => _openNavigationMenu(
              context: context,
            ),
            label: Icon(
              Icons.expand_more,
              color: context.secondaryTextColor,
              size: Theme.of(context).textTheme.displayLarge?.fontSize,
            ),
            icon: Text(
              'Collection',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const Gap(kTitleSpacer),
        ],
      ),
    );
  }
}
