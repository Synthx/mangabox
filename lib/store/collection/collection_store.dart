import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

class CollectionStore extends Cubit<CollectionState> {
  final CollectionService collectionService;
  final AuthStore authStore;

  CollectionStore({
    required this.collectionService,
    required this.authStore,
  }) : super(const CollectionState(
          books: {},
        ));

  Future<void> init() async {
    final books = await collectionService.get(
      user: authStore.userId,
    );
    emit(state.copyWith(
      books: books,
    ));
  }

  Future<Book> add({
    required Book book,
  }) async {
    final now = DateTime.now();
    book = book.copyWith(addedAt: now);

    final books = {
      ...state.books,
      book.id: now,
    };

    await collectionService.add(
      books: books,
      book: book,
      user: authStore.userId,
    );
    emit(state.copyWith(
      books: books,
    ));

    return book;
  }

  Future<Book> remove({
    required Book book,
  }) async {
    book = book.copyWith(addedAt: null);
    final books = {
      ...state.books,
    };
    books.remove(book.id);

    await collectionService.remove(
      books: books,
      book: book,
      user: authStore.userId,
    );
    emit(state.copyWith(
      books: books,
    ));

    return book;
  }

  DateTime? get(Book book) => state.books[book.id];
}
