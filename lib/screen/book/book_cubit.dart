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

  Future<void> load() async {
    emit(state.copyWith.sameEdition(loading: true));
    final page = await bookService.findSameEdition(
      editionId: state.book.edition.id,
      pageable: const Pageable(
        size: 6,
        sort: Sort(column: 'publicationDate', descending: true),
      ),
    );
    emit(state.copyWith.sameEdition(
      loading: false,
      content: page.content,
      total: page.total,
    ));
  }
}
