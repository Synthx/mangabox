import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'edition_cubit.dart';
import 'edition_state.dart';

class EditionScreenTitle extends StatelessWidget {
  const EditionScreenTitle({Key? key}) : super(key: key);

  void _openSeriesScreen({
    required BuildContext context,
    required Series series,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SeriesScreen(series: series),
    ));
  }

  void _openPublisherScreen({
    required BuildContext context,
    required Publisher publisher,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PublisherScreen(publisher: publisher),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditionScreenCubit, EditionScreenState, Edition>(
      selector: (state) => state.edition,
      builder: (context, edition) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSafeArea,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(kSpacer),
                Text(
                  edition.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Gap(kSpacer),
                MbxIconListTile(
                  title: edition.series.name,
                  subtitle: 'Série',
                  icon: Icons.style_outlined,
                  onTap: () => _openSeriesScreen(
                    context: context,
                    series: edition.series,
                  ),
                ),
                MbxIconListTile(
                  title: edition.publisher.name,
                  subtitle: 'Editeur',
                  icon: Icons.edit_outlined,
                  onTap: () => _openPublisherScreen(
                    context: context,
                    publisher: edition.publisher,
                  ),
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
