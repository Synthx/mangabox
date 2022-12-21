import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'book_cubit.dart';
import 'book_state.dart';

class BookScreenSameEdition extends StatelessWidget {
  const BookScreenSameEdition({Key? key}) : super(key: key);

  void _openBookScreen({
    required BuildContext context,
    required Book book,
  }) {
    final store = context.read<BookScreenCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: store,
        child: BookScreen<BookScreenCubit>(book: book),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Text(
            'De la même édition',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.primaryTextColor,
                ),
          ),
        ),
        const Gap(kSpacer),
        BlocSelector<BookScreenCubit, BookScreenState, List<Book>>(
          selector: (state) => state.sameEdition.content,
          builder: (context, books) {
            const double height = 300;
            return SizedBox(
              height: height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: kSafeArea,
                ),
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  final book = books[index];
                  return SizedBox(
                    width: height * kCardRatio,
                    child: BookCard(
                      onTap: () => _openBookScreen(
                        context: context,
                        book: book,
                      ),
                      book: book,
                      title: 'Volume ${book.volume}',
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
