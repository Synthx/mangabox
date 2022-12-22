import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'series_cubit.dart';
import 'series_state.dart';

class SeriesScreenTitle extends StatelessWidget {
  const SeriesScreenTitle({Key? key}) : super(key: key);

  void _openSeriesTypeScreen({
    required BuildContext context,
    required SeriesType seriesType,
  }) {
    final store = context.read<SeriesScreenCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: store,
        child: SeriesTypeScreen<SeriesScreenCubit>(seriesType: seriesType),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SeriesScreenCubit, SeriesScreenState, Series>(
      selector: (state) => state.series,
      builder: (context, series) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                series.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Gap(kSpacer),
              Text(
                'Résumé',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.primaryTextColor,
                    ),
              ),
              const Gap(kSpacer),
              ExpandableText(
                series.summary ?? 'Aucun résumé disponible',
                maxLines: 8,
              ),
              const Gap(10),
              MbxIconListTile(
                title: series.type.name,
                subtitle: 'Type',
                icon: Icons.edit_outlined,
                onTap: () => _openSeriesTypeScreen(
                  context: context,
                  seriesType: series.type,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
