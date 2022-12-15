import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';

class RecentBookScreenHeader extends StatelessWidget {
  const RecentBookScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(kTitleSpacer + context.safePaddingTop + kToolbarHeight),
          Text(
            'Nouveautés',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Gap(kTitleSpacer),
        ],
      ),
    );
  }
}
