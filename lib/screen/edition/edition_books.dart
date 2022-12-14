import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

import 'edition_cubit.dart';
import 'edition_state.dart';

class EditionScreenBooks extends StatelessWidget {
  const EditionScreenBooks({Key? key}) : super(key: key);

  void _openBookScreen({
    required BuildContext context,
    required Book book,
  }) {
    final store = context.read<EditionScreenCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: store,
        child: BookScreen<EditionScreenCubit>(book: book),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditionScreenCubit, EditionScreenState, List<Book>>(
      selector: (state) => state.books,
      builder: (context, books) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          sliver: SliverGrid(
            gridDelegate: kDefaultGridDelegate,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final book = books[index];
                return BookCard(
                  book: book,
                  title: 'Volume ${book.volume}',
                  onTap: () => _openBookScreen(
                    context: context,
                    book: book,
                  ),
                );
              },
              childCount: books.length,
            ),
          ),
        );
      },
    );
  }
}
