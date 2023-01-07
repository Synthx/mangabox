import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

import 'add_book_state.dart';

class EditionAddBookScreenStore extends Cubit<EditionAddBookScreenState> {
  final CollectionStore collectionStore;

  EditionAddBookScreenStore({
    required this.collectionStore,
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
