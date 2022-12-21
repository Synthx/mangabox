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

class SeriesScreenAuthors extends StatelessWidget {
  const SeriesScreenAuthors({Key? key}) : super(key: key);

  void _openAuthorScreen({
    required BuildContext context,
    required Author author,
  }) {
    final store = context.read<SeriesScreenCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: store,
        child: AuthorScreen(author: author),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SeriesScreenCubit, SeriesScreenState, List<Author>>(
      selector: (state) => state.series.authors,
      builder: (context, authors) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Auteur(s)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.primaryTextColor,
                    ),
              ),
              const Gap(kSpacer),
              ListView.separated(
                shrinkWrap: true,
                itemCount: authors.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  final author = authors[index];
                  return AuthorTile(
                    author: author,
                    onTap: () => _openAuthorScreen(
                      context: context,
                      author: author,
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
