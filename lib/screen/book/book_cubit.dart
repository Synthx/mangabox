import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

import 'book_state.dart';

class BookScreenCubit extends Cubit<BookScreenState> implements UpdatableStore {
  final UpdatableStore? updatableStore;
  final CollectionStore collectionStore;
  final BookService bookService;

  BookScreenCubit({
    required this.collectionStore,
    required this.bookService,
    required Book book,
    this.updatableStore,
  }) : super(BookScreenState(
          book: book,
          sameEdition: const LazyState(),
          loading: false,
        ));

  Future<void> init() async {
    emit(state.copyWith.sameEdition(loading: true));
    final page = await bookService.findByEdition(
      edition: state.book.edition.id,
      pageable: const Pageable(size: 6),
    );
    emit(state.copyWith.sameEdition(
      loading: false,
      content: page.content
          .where((e) => e.id != state.book.id)
          .map((e) => e.copyWith(addedAt: collectionStore.get(e)))
          .toList(growable: false),
      total: page.total,
    ));
  }

  Future<void> addToCollection() async {
    emit(state.copyWith(loading: true));
    final book = await collectionStore.add(
      book: state.book,
    );
    await updatableStore?.update([book]);
    emit(state.copyWith(
      loading: false,
      book: book,
    ));
  }

  Future<void> removeFromCollection() async {
    emit(state.copyWith(loading: true));
    final book = await collectionStore.remove(
      book: state.book,
    );
    await updatableStore?.update([book]);
    emit(state.copyWith(
      loading: false,
      book: book,
    ));
  }

  @override
  Future<void> update(List<Book> books) async {
    await updatableStore?.update(books);
    emit(state.copyWith(
      book: books.firstWhere(
        (e) => e.id == state.book.id,
        orElse: () => state.book,
      ),
      sameEdition: state.sameEdition.copyWith(
        content: state.sameEdition.content
            .map((e) => books.firstWhere((b) => b.id == e.id, orElse: () => e))
            .toList(growable: false),
      ),
    ));
  }
}
