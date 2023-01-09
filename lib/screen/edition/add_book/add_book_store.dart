import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

import 'add_book_state.dart';

class EditionAddBookScreenStore extends Cubit<EditionAddBookScreenState> {
  final CollectionStore collectionStore;
  final DialogService dialogService;

  EditionAddBookScreenStore({
    required this.collectionStore,
    required this.dialogService,
    required Edition edition,
    required List<Book> books,
  }) : super(EditionAddBookScreenState(
          loading: false,
          edition: edition,
          books: books,
        ));

  Future<void> selectBook(Book book) async {
    emit(state.copyWith(
      books: state.books
          .map((b) => b.id == book.id
              ? book.copyWith(
                  addedAt: book.addedAt != null ? null : DateTime.now(),
                )
              : b)
          .toList(growable: false),
    ));
  }

  Future<void> selectAll() async {
    emit(state.copyWith(
      books: state.books
          .map((b) => b.copyWith(addedAt: DateTime.now()))
          .toList(growable: false),
    ));
  }

  Future<void> unselectAll() async {
    emit(state.copyWith(
      books: state.books
          .map((b) => b.copyWith(addedAt: null))
          .toList(growable: false),
    ));
  }

  Future<bool> save() async {
    final now = DateTime.now();
    if (state.books
        .any((e) => e.addedAt != null && e.publicationDate.isAfter(now))) {
      final confirmed = await dialogService.askConfirmation(
        title: 'Sauvegarder ?',
        content:
            'Un ou plusieurs livres n\'ont pas encore été publiés, Êtes-vous sûr de vouloir les ajouter à votre collection ?',
      );
      if (confirmed != true) return false;
    }

    emit(state.copyWith(loading: true));
    try {
      await collectionStore.saveMany(
        books: state.books,
        edition: state.edition.id,
      );

      return true;
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(loading: false));

      return false;
    }
  }
}
