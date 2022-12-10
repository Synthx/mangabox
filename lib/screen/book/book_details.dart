import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/data/data.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class _Detail {
  final String title;
  final String value;

  const _Detail({
    required this.title,
    required this.value,
  });
}

class BookScreenDetails extends StatelessWidget {
  const BookScreenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookScreenCubit, BookScreenState, Book>(
      selector: (state) => state.book,
      builder: (context, book) {
        final List<_Detail> details = [
          _Detail(
            title: 'Date de publication',
            value: book.localePublicationDate(),
          ),
          if (book.pagesCount != null)
            _Detail(
              title: 'Nombre de pages',
              value: book.pagesCount.toString(),
            ),
          _Detail(
            title: 'Référence',
            value: book.isbn,
          ),
        ];

        return ListView.separated(
          shrinkWrap: true,
          itemCount: details.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (context, index) => const Gap(10),
          itemBuilder: (context, index) {
            final detail = details[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  detail.value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).textTheme.displayLarge?.color,
                      ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
