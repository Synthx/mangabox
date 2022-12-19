import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/store/store.dart';

import 'book_state.dart';

class BookScreenCubit extends Cubit<BookScreenState> {
  final CollectionService collectionService;
  final BookService bookService;
  final AuthCubit authCubit;

  BookScreenCubit({
    required this.collectionService,
    required this.bookService,
    required this.authCubit,
    required Book book,
  }) : super(BookScreenState(
          book: AddableState(content: book),
          sameEdition: const LazyState(),
        ));

  Future<void> init() async {
    emit(state.copyWith.sameEdition(loading: true));
    final page = await bookService.findByEdition(
      edition: state.book.content.edition.id,
      pageable: const Pageable(size: 6),
    );
    emit(state.copyWith.sameEdition(
      loading: false,
      content: page.content,
      total: page.total,
    ));
  }

  Future<void> addToCollection() async {
    emit(state.copyWith.book(loading: true));
    await collectionService.add(
      book: state.book.content,
      user: authCubit.state.user!.uid,
    );
    emit(state.copyWith.book(
      loading: false,
      owned: true,
    ));
  }

  Future<void> removeFromCollection() async {
    emit(state.copyWith.book(loading: true));
    await collectionService.remove(
      book: state.book.content,
      user: authCubit.state.user!.uid,
    );
    emit(state.copyWith.book(
      loading: false,
      owned: false,
    ));
  }
}
