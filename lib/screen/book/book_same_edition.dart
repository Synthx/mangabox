import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'book.state.dart';
import 'book_cubit.dart';

class BookScreenSameEdition extends StatelessWidget {
  const BookScreenSameEdition({Key? key}) : super(key: key);

  void _openBookScreen({
    required BuildContext context,
    required Book book,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BookScreen(book: book),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSpacer,
          ),
          child: Text(
            'De la même édition',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Gap(kSpacer),
        BlocSelector<BookScreenCubit, BookScreenState, List<Book>>(
          selector: (state) => state.sameEdition.content,
          builder: (context, books) {
            const double height = 200;
            return SizedBox(
              height: height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: kSpacer,
                ),
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  final book = books[index];
                  return GestureDetector(
                    onTap: () => _openBookScreen(
                      context: context,
                      book: book,
                    ),
                    child: SizedBox(
                      height: height,
                      width: height * kPictureRatio,
                      child: Picture(
                        picture: book.picture,
                      ),
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
