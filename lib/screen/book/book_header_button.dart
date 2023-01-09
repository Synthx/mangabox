import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/widget/widget.dart';

import 'book_cubit.dart';
import 'book_state.dart';

class BookScreenHeaderButton extends StatelessWidget {
  const BookScreenHeaderButton({Key? key}) : super(key: key);

  void _addToCollection({
    required BuildContext context,
  }) {
    context.read<BookScreenCubit>().addToCollection();
  }

  void _removeFromCollection({
    required BuildContext context,
  }) {
    context.read<BookScreenCubit>().removeFromCollection();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookScreenCubit, BookScreenState>(
      buildWhen: (prev, curr) =>
          prev.book.addedAt != curr.book.addedAt ||
          prev.loading != curr.loading,
      builder: (context, state) {
        if (state.loading) {
          return MbxButton.loading();
        }

        if (state.book.addedAt != null) {
          return MbxButton.text(
            'Retirer',
            onTap: () => _removeFromCollection(
              context: context,
            ),
          );
        }

        final book = state.book;
        return MbxButton.icon(
          book.publicationDate.isAfter(DateTime.now())
              ? 'Pré-ajouter'
              : 'Ajouter',
          icon: Icons.add,
          onTap: () => _addToCollection(
            context: context,
          ),
        );
      },
    );
  }
}
