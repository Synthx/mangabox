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

class SeriesScreenEditions extends StatelessWidget {
  const SeriesScreenEditions({Key? key}) : super(key: key);

  void _openEditionScreen({
    required BuildContext context,
    required Edition edition,
  }) {
    final store = context.read<SeriesScreenCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: store,
        child: EditionScreen(edition: edition),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SeriesScreenCubit, SeriesScreenState, List<Edition>>(
      selector: (state) => state.editions.content,
      builder: (context, editions) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edition(s)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.primaryTextColor,
                    ),
              ),
              const Gap(kSpacer),
              ListView.separated(
                shrinkWrap: true,
                itemCount: editions.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Gap(kSpacer),
                itemBuilder: (context, index) {
                  return EditionTile(
                    edition: editions[index],
                    onTap: () => _openEditionScreen(
                      context: context,
                      edition: editions[index],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
