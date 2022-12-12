import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/extension/extension.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'edition_cubit.dart';
import 'edition_state.dart';

class EditionScreenTitle extends StatelessWidget {
  const EditionScreenTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditionScreenCubit, EditionScreenState, Edition>(
      selector: (state) => state.edition,
      builder: (context, edition) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSpacer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  edition.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Gap(kSpacer),
                MbxIconListTile(
                  title: edition.series.name,
                  subtitle: 'Série',
                  icon: Icons.style_outlined,
                ),
                const Gap(kSpacer),
                Text(
                  'Volumes de cette édition',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.primaryTextColor,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
