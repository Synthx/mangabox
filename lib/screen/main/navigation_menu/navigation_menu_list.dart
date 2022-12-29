import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';

import 'navigation_menu_state.dart';
import 'navigation_menu_store.dart';

class NavigationMenuList extends StatelessWidget {
  const NavigationMenuList({Key? key}) : super(key: key);

  void _onItemSelected({
    required BuildContext context,
    required int index,
  }) {
    Navigator.of(context).pop(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationMenuStore, NavigationMenuState>(
      buildWhen: (prev, curr) => prev.selectedIndex != curr.selectedIndex,
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.items.length,
          padding: const EdgeInsets.symmetric(
            vertical: kSpacer,
            horizontal: kSafeArea,
          ),
          itemBuilder: (context, index) {
            final item = state.items[index];
            final selected = state.selectedIndex == index;
            final color = selected
                ? context.primaryTextColor
                : context.secondaryTextColor;
            final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontSize: 19,
                );

            return ListTile(
              onTap: () => _onItemSelected(
                context: context,
                index: index,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: color,
                    size: 26,
                  ),
                  const Gap(kSpacer),
                  Text(
                    item.title,
                    style: style,
                  ),
                  if (selected)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kSpacer,
                      ),
                      child: Text(
                        '·',
                        style: style?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
