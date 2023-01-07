import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/widget/widget.dart';

import 'add_book/add_book.dart';
import 'edition_cubit.dart';
import 'edition_state.dart';

class EditionScreenHeaderButton extends StatelessWidget {
  const EditionScreenHeaderButton({Key? key}) : super(key: key);

  void _openAddBookScreen({
    required BuildContext context,
  }) async {
    final store = context.read<EditionScreenCubit>();
    final books = await Navigator.of(context).push<List<Book>>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EditionAddBookScreen(
          edition: store.state.edition,
          books: store.state.books,
        ),
      ),
    );

    if (books != null) {
      store.update(books);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditionScreenCubit, EditionScreenState>(
      buildWhen: (prev, curr) =>
          prev.edition.ownedBooks != curr.edition.ownedBooks ||
          prev.loading != curr.loading,
      builder: (context, state) {
        if (state.loading) {
          return MbxButton.loading();
        }

        final edition = state.edition;
        if (edition.ownedBooks != null && edition.ownedBooks != 0) {
          return MbxButton.text(
            '${edition.ownedBooks} Volumes',
            onTap: () => _openAddBookScreen(context: context),
          );
        }

        return MbxButton.icon(
          'Ajouter',
          icon: Icons.add,
          onTap: () => _openAddBookScreen(
            context: context,
          ),
        );
      },
    );
  }
}
