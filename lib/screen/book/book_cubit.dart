import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

import 'book_state.dart';

class BookScreenCubit extends Cubit<BookScreenState> {
  final CollectionStore collectionStore;
  final BookService bookService;

  BookScreenCubit({
    required this.collectionStore,
    required this.bookService,
    required Book book,
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
      content: page.content,
      total: page.total,
    ));
  }

  Future<void> addToCollection() async {
    emit(state.copyWith(loading: true));
    await collectionStore.add(
      book: state.book,
    );
    emit(state.copyWith(
      loading: false,
      book: state.book.copyWith(
        addedAt: DateTime.now(),
      ),
    ));
  }

  Future<void> removeFromCollection() async {
    emit(state.copyWith(loading: true));
    await collectionStore.remove(
      book: state.book,
    );
    emit(state.copyWith(
      loading: false,
      book: state.book.copyWith(
        addedAt: null,
      ),
    ));
  }
}
