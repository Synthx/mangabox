import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/data/data.dart';

import 'book.state.dart';

class BookScreenCubit extends Cubit<BookScreenState> {
  final BookService bookService;

  BookScreenCubit({
    required this.bookService,
    required Book book,
  }) : super(BookScreenState(
          book: book,
          sameEdition: const LazyState(),
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
}
