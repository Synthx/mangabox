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
          editions: LazyState(),
        ));

  Future<void> init() async {
    // todo: parallelize /w destructuring and await Future.wait
    final books = await collectionService.get(
      user: authStore.userId,
    );
    final page = await collectionService.getEditions(
      user: authStore.userId,
    );
    emit(state.copyWith(
      books: books,
      editions: state.editions.copyWith(
        content: page.content,
        total: page.total,
      ),
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
      editions: state.editions.copyWith(
        content: state.editions.content
            .map((e) => e.id == book.edition.id
                ? e.copyWith(
                    picture: book.picture,
                    ownedBooks: e.ownedBooks! + 1,
                  )
                : e)
            .toList(growable: false),
      ),
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

  Future<void> loadMore() async {
    emit(state.copyWith.editions(loading: true));
    final page = await collectionService.getEditions(
      user: authStore.userId,
    );
    emit(state.copyWith.editions(
      content: [...state.editions.content, ...page.content],
      loading: false,
    ));
  }

  DateTime? get(Book book) => state.books[book.id];
}
