import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/theme/theme.dart';

import 'add_book_state.dart';
import 'add_book_store.dart';

class EditionAddBookSaveButton extends StatelessWidget {
  const EditionAddBookSaveButton({Key? key}) : super(key: key);

  void _save({
    required BuildContext context,
  }) async {
    final navigator = Navigator.of(context);
    final store = context.read<EditionAddBookScreenStore>();

    final saved = await store.save();
    if (saved) {
      navigator.pop(store.state.books);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _save(context: context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusFull),
        ),
      ),
      label: const Icon(
        Icons.save_outlined,
        size: 20,
      ),
      icon: BlocSelector<EditionAddBookScreenStore, EditionAddBookScreenState,
          int>(
        selector: (state) => state.books.where((e) => e.addedAt != null).length,
        builder: (context, ownedBooks) {
          return Text(
            ownedBooks > 0 ? '$ownedBooks Volumes' : 'Sauvegarder',
            style: const TextStyle(
              fontSize: 15,
            ),
          );
        },
      ),
    );
  }
}
