import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class _Detail {
  final String title;
  final String value;
  final IconData icon;

  const _Detail({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class BookScreenDetails extends StatelessWidget {
  const BookScreenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSafeArea,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Plus de détails',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.primaryTextColor,
                ),
          ),
          const Gap(10),
          BlocSelector<BookScreenCubit, BookScreenState, Book>(
            selector: (state) => state.book,
            builder: (context, book) {
              final List<_Detail> details = [
                _Detail(
                  title: 'Date de publication',
                  value: book.localePublicationDate(),
                  icon: Icons.calendar_today_outlined,
                ),
                if (book.pagesCount != null)
                  _Detail(
                    title: 'Nombre de pages',
                    value: book.pagesCount.toString(),
                    icon: Icons.auto_stories_outlined,
                  ),
                _Detail(
                  title: 'Référence',
                  value: book.isbn,
                  icon: Icons.data_object_outlined,
                ),
              ];

              return ListView.builder(
                shrinkWrap: true,
                itemCount: details.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final detail = details[index];
                  return MbxIconListTile(
                    title: detail.value,
                    subtitle: detail.title,
                    icon: detail.icon,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
