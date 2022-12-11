import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/extension/extension.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class BookScreenInformation extends StatelessWidget {
  const BookScreenInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookScreenCubit, BookScreenState, Book>(
      selector: (state) => state.book,
      builder: (context, book) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSpacer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kSpacer,
                  vertical: kSpacer,
                ),
                child: Center(
                  child: Text(
                    '${book.localePublicationDate()}  ·  ${book.edition.status.locale()}  ·  ${book.edition.series.year}  ·  ${book.edition.publisher.name}  ·  ${book.edition.series.type.name}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              Text(
                book.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Gap(kSpacer),
              Text(
                'Résumé',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.primaryTextColor,
                    ),
              ),
              const Gap(10),
              ExpandableText(
                book.summary ?? 'Aucun résumé disponible',
                maxLines: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
