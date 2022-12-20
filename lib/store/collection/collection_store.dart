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

  Future<void> add({
    required Book book,
  }) async {
    final books = {
      ...state.books,
      book.id: DateTime.now(),
    };

    await collectionService.add(
      books: books,
      book: book,
      user: authStore.userId,
    );
    emit(state.copyWith(
      books: books,
    ));
  }

  Future<void> remove({
    required Book book,
  }) async {
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
  }

  bool has(Book book) => state.books.containsKey(book.id);

  DateTime? get(Book book) => state.books[book.id];
}
