import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/dialog/dialog.dart';
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

  Future<void> _removeFromCollection({
    required BuildContext context,
  }) async {
    final cubit = context.read<BookScreenCubit>();
    final result = await showCupertinoModalPopup<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => const ConfirmationDialog(
        title: 'Confirmer',
        content:
            'Êtes-vous sûr de vouloir retirer ce livre de votre collection?',
      ),
    );

    if (result == true) {
      cubit.removeFromCollection();
    }
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

        return MbxButton.icon(
          'Ajouter',
          icon: Icons.add,
          onTap: () => _addToCollection(
            context: context,
          ),
        );
      },
    );
  }
}
