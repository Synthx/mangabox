import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

import 'edition_state.dart';

class EditionScreenCubit extends Cubit<EditionScreenState>
    implements UpdatableStore {
  final CollectionStore collectionStore;
  final UpdatableStore? updatableStore;
  final BookService bookService;

  EditionScreenCubit({
    required this.collectionStore,
    required this.bookService,
    required Edition edition,
    this.updatableStore,
  }) : super(EditionScreenState(
          edition: edition,
          books: [],
          loading: false,
        ));

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    final page = await bookService.findByEdition(
      edition: state.edition.id,
      pageable: const Pageable(size: 200),
    );
    final books = page.content
        .map((e) => e.copyWith(addedAt: collectionStore.get(e)))
        .toList(growable: false);

    emit(state.copyWith(
      loading: false,
      books: books,
      edition: state.edition.copyWith(
        ownedBooks: books.where((e) => e.addedAt != null).length,
      ),
    ));
  }

  @override
  Future<void> update(List<Book> books) async {
    await updatableStore?.update(books);
    final newBooks = state.books
        .map((e) => e.copyWith(addedAt: collectionStore.get(e)))
        .toList(growable: false);
    emit(state.copyWith(
      edition: state.edition.copyWith(
        ownedBooks: newBooks.where((e) => e.addedAt != null).length,
      ),
      books: newBooks,
    ));
  }
}
