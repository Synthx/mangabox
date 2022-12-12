import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'series_cubit.dart';
import 'series_state.dart';

class SeriesScreenSummary extends StatelessWidget {
  const SeriesScreenSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SeriesScreenCubit, SeriesScreenState, String?>(
      selector: (state) => state.series.summary,
      builder: (context, summary) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Résumé',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.primaryTextColor,
                    ),
              ),
              const Gap(kSpacer),
              ExpandableText(
                summary ?? 'Aucun résumé disponible',
                maxLines: 8,
              ),
            ],
          ),
        );
      },
    );
  }
}
