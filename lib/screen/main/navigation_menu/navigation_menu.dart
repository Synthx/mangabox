import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'navigation_menu_list.dart';
import 'navigation_menu_store.dart';

class NavigationMenu extends StatelessWidget {
  final int selectedIndex;

  const NavigationMenu({
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationMenuStore(
        selectedIndex: selectedIndex,
      ),
      child: Scaffold(
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.97),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Positioned.fill(
                child: Center(
                  child: NavigationMenuList(),
                ),
              ),
              Positioned(
                left: kSafeArea,
                right: kSafeArea,
                bottom: kSpacer,
                child: Center(
                  child: MbxIconButton(
                    icon: Icons.close,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
